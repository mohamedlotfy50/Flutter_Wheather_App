import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:location/location.dart';
import 'package:permission_handler/permission_handler.dart';

import 'package:weather/UI/pages/Weather.dart';
import 'package:weather/UI/widgets/weather_loading.dart';
import 'package:weather/bloc/weather/weather_bloc.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    if (checkPermition() != true) {
      Future.delayed(Duration(milliseconds: 5100)).then((_) {
        BlocProvider.of<WeatherBloc>(context).add(GetPlaceWeather());

        return Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => Weather(),
          ),
        );
      });
    } else {
      Future.delayed(Duration(milliseconds: 5100)).then((_) {
        BlocProvider.of<WeatherBloc>(context).add(PermissionDenied());

        return Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => Weather(),
          ),
        );
      });
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            WeatherAnimation(),
          ],
        ),
      ),
    );
  }
}

checkPermition() async {
  Location location = Location();
  await location.requestPermission();

  if (await Permission.location.isDenied) {
    return false;
  } else {
    return true;
  }
}
