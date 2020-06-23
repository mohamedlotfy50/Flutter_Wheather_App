import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather/UI/pages/splash_screen.dart';
import 'package:weather/bloc/theme/themebloc_bloc.dart';
import 'package:weather/bloc/weather/weather_bloc.dart';
import 'package:weather/services/weather_api.dart';
import 'package:weather/utils/shared_prefferances.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Constant.preferences = await SharedPreferences.getInstance();
  runApp(MyApp());
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Constant.preferences.getBool('IsDark') ??
        Constant.preferences.setBool('IsDark', false);

    return MultiBlocProvider(
      providers: [
        BlocProvider<WeatherBloc>(
          create: (context) => WeatherBloc(WeatherApi()),
        ),
        BlocProvider<ThemeBloc>(
          create: (context) => ThemeBloc(),
        ),
      ],
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Weather',
            theme: state.themeData,
            home: SplashScreen(),
          );
        },
      ),
    );
  }
}
