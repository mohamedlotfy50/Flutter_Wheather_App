import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:location/location.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:weather/UI/pages/Weather.dart';
import 'package:weather/bloc/weather/weather_bloc.dart';

class ErrorPage extends StatelessWidget {
  final String errorHeader;
  final String message;

  const ErrorPage({Key key, this.errorHeader, this.message}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset('assets/images/error.png'),
          Text(
            errorHeader,
            style: Theme.of(context).textTheme.headline3,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              message,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyText2,
            ),
          ),
          FlatButton.icon(
              onPressed: () async {
                if (errorHeader == 'The permission has Denied') {
                  Location location = Location();

                  await location.requestPermission();
                  if (location.hasPermission() !=
                      Permission.location.isGranted) {
                    await location.requestPermission();
                  } else {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Weather(),
                      ),
                    );
                    BlocProvider.of<WeatherBloc>(context).add(
                      GetPlaceWeather(),
                    );
                  }
                } else {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Weather(),
                    ),
                  );
                  BlocProvider.of<WeatherBloc>(context).add(
                    GetPlaceWeather(),
                  );
                }
              },
              icon: Icon(
                Icons.refresh,
                color: Theme.of(context).textTheme.headline3.color,
              ),
              label: Text(
                'Reload',
                style: Theme.of(context).textTheme.headline3,
              ))
        ],
      ),
    );
  }
}
