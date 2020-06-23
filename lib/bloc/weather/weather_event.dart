part of 'weather_bloc.dart';

abstract class WeatherEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class GetSearchedWeather extends WeatherEvent {
  final String _cityName;
  GetSearchedWeather(this._cityName);
  @override
  List<Object> get props => [_cityName];
}

class GetPlaceWeather extends WeatherEvent {}

class PermissionDenied extends WeatherEvent {}
