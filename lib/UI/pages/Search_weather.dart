import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/UI/widgets/earth_rotate.dart';
import 'package:weather/bloc/weather/weather_bloc.dart';
import 'dart:io' show Platform;

class SearchCity extends StatefulWidget {
  @override
  _SearchCityState createState() => _SearchCityState();
}

class _SearchCityState extends State<SearchCity> {
  String _cityName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              EarthRotate(),
              Padding(
                padding: const EdgeInsets.only(
                  left: 15,
                  right: 15,
                  bottom: 10,
                ),
                child: TextField(
                  style: TextStyle(
                    color: Theme.of(context).textTheme.headline3.color,
                  ),
                  onChanged: (value) => {_cityName = value},
                  decoration: InputDecoration(
                    fillColor: Theme.of(context).accentColor,
                    filled: true,
                    hintText: 'Enter the City name',
                    hintStyle: TextStyle(
                        color: Theme.of(context).textTheme.headline3.color),
                    border: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Theme.of(context).dividerColor)),
                  ),
                ),
              ),
              if (Platform.isAndroid)
                Container(
                  width: 150,
                  height: 50,
                  child: RaisedButton.icon(
                    onPressed: () {
                      if (_cityName != null) {
                        BlocProvider.of<WeatherBloc>(context).add(
                          GetSearchedWeather(_cityName.toLowerCase()),
                        );
                        Navigator.pop(context);
                      }
                    },
                    icon: Icon(
                      Icons.search,
                      color: Theme.of(context).iconTheme.color,
                    ),
                    label: Text(
                      'Search',
                      style: Theme.of(context).textTheme.headline3,
                    ),
                    color: Theme.of(context).dividerColor,
                  ),
                ),
              if (Platform.isIOS)
                CupertinoButton(
                    color: Theme.of(context).dividerColor,
                    child: Text(
                      'Search',
                      style: Theme.of(context).textTheme.headline3,
                    ),
                    onPressed: () {
                      if (_cityName != null) {
                        BlocProvider.of<WeatherBloc>(context).add(
                          GetSearchedWeather(_cityName.toLowerCase()),
                        );
                        Navigator.pop(context);
                      }
                    })
            ],
          ),
        ),
      ),
    );
  }
}
