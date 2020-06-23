import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:weather/models/weather_data_model.dart';
import 'package:weather/services/weather_api.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherApi weatherApi;
  WeatherBloc(this.weatherApi);
  @override
  WeatherState get initialState => WeatherIsNotSearched();

  @override
  Stream<WeatherState> mapEventToState(
    WeatherEvent event,
  ) async* {
    if (event is GetSearchedWeather) {
      yield WeatherIsLoading();
      try {
        WeatherModel weather =
            await weatherApi.getWeatherByCityName(cityName: event._cityName);
        if (weather != null) {
          yield WeatherIsLoaded(weather);
        } else {
          yield WeatherIsNotLoaded();
        }
      } catch (_) {
        yield NoInterNetConnection();
      }
    } else if (event is GetPlaceWeather) {
      yield WeatherIsLoading();
      try {
        WeatherModel weather = await weatherApi.getWeatherByCoOrdinates();
        if (weather != null) {
          yield WeatherIsLoaded(weather);
        } else {
          yield WeatherIsNotLoaded();
        }
      } catch (_) {
        yield NoInterNetConnection();
      }
    } else if (event is PermissionDenied) {
      yield NoPermission();
    }
  }
}
