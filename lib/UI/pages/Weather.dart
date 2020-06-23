import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/UI/pages/Search_weather.dart';
import 'package:weather/UI/pages/erro_page.dart';
import 'package:weather/UI/widgets/Icon_data.dart';
import 'package:weather/UI/widgets/background_rect.dart';
import 'package:weather/UI/widgets/state_and_date.dart';
import 'package:weather/UI/widgets/sun_loading.dart';
import 'package:weather/UI/widgets/temp_details.dart';
import 'package:weather/UI/widgets/zigzag_progress.dart';
import 'package:weather/bloc/theme/app_theme.dart';
import 'package:weather/bloc/theme/themebloc_bloc.dart';
import 'package:weather/bloc/weather/weather_bloc.dart';
import 'package:intl/intl.dart';
import 'package:weather/utils/shared_prefferances.dart';

class Weather extends StatefulWidget {
  @override
  _WeatherState createState() => _WeatherState();
}

class _WeatherState extends State<Weather> {
  bool isDark = Constant.preferences.getBool('IsDark');

  getTime(int timeInUnix, String outPutDataType) {
    DateTime date = DateTime.fromMicrosecondsSinceEpoch(timeInUnix * 1000000);
    String dateString = DateFormat('EEE, dMMM').format(date);
    String time = DateFormat('h:mm a').format(date);
    if (outPutDataType == 'date') {
      return '$dateString';
    }
    return '$time';
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherBloc, WeatherState>(
      bloc: BlocProvider.of<WeatherBloc>(context),
      builder: (context, state) {
        if (state is WeatherIsNotLoaded) {
          return ErrorPage(
            errorHeader: 'Something went wrong',
            message: 'Please check your inputs and try again',
          );
        } else if (state is NoInterNetConnection) {
          return ErrorPage(
            errorHeader: 'No InterNet connection',
            message:
                'Please check your permission make sure you are connected to the internet and try again',
          );
        } else if (state is NoPermission) {
          return ErrorPage(
            errorHeader: 'The permission has Denied',
            message:
                'Please make sure to give the app the location permission to get the weather',
          );
        } else {
          return Scaffold(
            appBar: AppBar(
              actions: <Widget>[
                IconButton(
                  icon: Icon(Icons.location_on),
                  onPressed: () {
                    BlocProvider.of<WeatherBloc>(context).add(
                      GetPlaceWeather(),
                    );
                  },
                ),
                IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SearchCity(),
                      ),
                    );
                  },
                ),
              ],
              leading: IconButton(
                icon: RotatedBox(
                  child:
                      isDark ? Icon(Icons.wb_sunny) : Icon(Icons.brightness_3),
                  quarterTurns: 2,
                ),
                onPressed: () {
                  isDark
                      ? BlocProvider.of<ThemeBloc>(context)
                          .add(ChangeThemeEvent(appTheme: Themes.brightTheme))
                      : BlocProvider.of<ThemeBloc>(context)
                          .add(ChangeThemeEvent(appTheme: Themes.darkTheme));
                  isDark = !isDark;
                  Constant.preferences.setBool('IsDark', isDark);
                },
              ),
              elevation: 0,
              title: Text('Weather'),
              centerTitle: true,
            ),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  BlocBuilder<WeatherBloc, WeatherState>(
                    bloc: BlocProvider.of<WeatherBloc>(context),
                    builder: (context, state) {
                      if (state is WeatherIsLoading) {
                        return StateDate(
                          weatherIcon: SunLoading(),
                          date: ZigZagProgressIndicator(),
                        );
                      } else if (state is WeatherIsLoaded) {
                        return StateDate(
                          weatherIcon: Image.network(
                            'http://openweathermap.org/img/w/${state.getWeather.weather[0].icon}.png',
                            fit: BoxFit.fill,
                          ),
                          date: Text(
                            '${getTime(state.getWeather.dt, 'date')}',
                            style: Theme.of(context).textTheme.bodyText2,
                            textAlign: TextAlign.left,
                          ),
                        );
                      } else {
                        return Container();
                      }
                    },
                  ),
                  BlocBuilder<WeatherBloc, WeatherState>(
                    bloc: BlocProvider.of<WeatherBloc>(context),
                    builder: (context, state) {
                      if (state is WeatherIsLoading) {
                        return Container(
                          padding: EdgeInsets.symmetric(horizontal: 30),
                          child: CircularProgressIndicator(
                            backgroundColor: Colors.red[300],
                            valueColor:
                                AlwaysStoppedAnimation<Color>(Colors.red),
                          ),
                        );
                      } else if (state is WeatherIsLoaded) {
                        return TempDetails(
                          place:
                              '${state.getWeather.name}, ${state.getWeather.sys.country}',
                          sunRise:
                              '${getTime(state.getWeather.sys.sunrise, 'time')}',
                          sunSet:
                              '${getTime(state.getWeather.sys.sunset, 'time')}',
                          temp:
                              '${(state.getWeather.main.temp - 273.15).floor()}',
                        );
                      } else {
                        return Container();
                      }
                    },
                  ),
                  Column(
                    children: <Widget>[
                      BackgroundRecBox(
                        widgetList: <Widget>[
                          WeatherIconData(
                            image: 'assets/images/humidity.png',
                            text: 'Humidity',
                            size: 35.0,
                            child: BlocBuilder<WeatherBloc, WeatherState>(
                              bloc: BlocProvider.of<WeatherBloc>(context),
                              builder: (context, state) {
                                if (state is WeatherIsLoading) {
                                  return ZigZagProgressIndicator();
                                } else if (state is WeatherIsLoaded) {
                                  return Text(
                                    '${state.getWeather.main.humidity} %',
                                    style:
                                        Theme.of(context).textTheme.bodyText1,
                                  );
                                } else {
                                  return Container();
                                }
                              },
                            ),
                          ),
                          WeatherIconData(
                            image: 'assets/images/cloud.png',
                            text: 'Clouds',
                            size: 35.0,
                            child: BlocBuilder<WeatherBloc, WeatherState>(
                              bloc: BlocProvider.of<WeatherBloc>(context),
                              builder: (context, state) {
                                if (state is WeatherIsLoading) {
                                  return ZigZagProgressIndicator();
                                } else if (state is WeatherIsLoaded) {
                                  return Text(
                                    '${state.getWeather.clouds.all} %',
                                    style:
                                        Theme.of(context).textTheme.bodyText1,
                                  );
                                } else {
                                  return Container();
                                }
                              },
                            ),
                          ),
                          WeatherIconData(
                            image: 'assets/images/pressure.png',
                            text: 'Pressure',
                            size: 40.0,
                            child: BlocBuilder<WeatherBloc, WeatherState>(
                              bloc: BlocProvider.of<WeatherBloc>(context),
                              builder: (context, state) {
                                if (state is WeatherIsLoading) {
                                  return ZigZagProgressIndicator();
                                } else if (state is WeatherIsLoaded) {
                                  return Text(
                                    '${state.getWeather.main.pressure} HPA',
                                    style:
                                        Theme.of(context).textTheme.bodyText1,
                                  );
                                } else {
                                  return Container();
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      BackgroundRecBox(
                        widgetList: <Widget>[
                          WeatherIconData(
                            image: 'assets/images/wind.png',
                            text: 'Wind speed',
                            size: 60.0,
                            child: BlocBuilder<WeatherBloc, WeatherState>(
                              bloc: BlocProvider.of<WeatherBloc>(context),
                              builder: (context, state) {
                                if (state is WeatherIsLoading) {
                                  return ZigZagProgressIndicator();
                                } else if (state is WeatherIsLoaded) {
                                  return Text(
                                    '${state.getWeather.wind.speed} M/S',
                                    style:
                                        Theme.of(context).textTheme.bodyText1,
                                  );
                                } else {
                                  return Container();
                                }
                              },
                            ),
                          ),
                          WeatherIconData(
                            image: 'assets/images/windRose.png',
                            text: 'Wind degree',
                            size: 35.0,
                            child: BlocBuilder<WeatherBloc, WeatherState>(
                              bloc: BlocProvider.of<WeatherBloc>(context),
                              builder: (context, state) {
                                if (state is WeatherIsLoading) {
                                  return ZigZagProgressIndicator();
                                } else if (state is WeatherIsLoaded) {
                                  return Text(
                                    '${state.getWeather.wind.deg} º',
                                    style:
                                        Theme.of(context).textTheme.bodyText1,
                                  );
                                } else {
                                  return Container();
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
        }
      },
    );
  }
}
