part of 'weather_bloc.dart';

abstract class WeatherState extends Equatable {
  @override
  List<Object> get props => [];
}

class NoPermission extends WeatherState {}

class WeatherWithLocation extends WeatherState {}

class WeatherIsLoading extends WeatherState {}

class WeatherIsLoaded extends WeatherState {
  final WeatherModel _weatehr;
  WeatherIsLoaded(this._weatehr);
  WeatherModel get getWeather => _weatehr;
  @override
  List<Object> get props => [_weatehr];
}

class WeatherIsNotLoaded extends WeatherState {}

class NoInterNetConnection extends WeatherState {}

class WeatherIsNotSearched extends WeatherState {}
