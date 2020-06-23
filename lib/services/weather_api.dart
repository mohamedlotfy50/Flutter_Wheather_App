import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:location/location.dart';
import 'package:weather/models/weather_data_model.dart';

class WeatherApi {
  final String apiKey =
      'the api key'; //TODO: please add your api key to make the app work
  Location location = Location();
  LocationData _locationData;

  Future getWeatherByCoOrdinates() async {
    _locationData = await location.getLocation();

    http.Response response = await http.get(
        'https://api.openweathermap.org/data/2.5/weather?lat=${_locationData.latitude}&lon=${_locationData.longitude}&appid=$apiKey');
    if (response.statusCode == 200) {
      return WeatherModel.fromJson(json.decode(response.body));
    } else {
      return null;
    }
  }

  Future getWeatherByCityName({String cityName}) async {
    http.Response response = await http.get(
        'https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$apiKey');
    if (response.statusCode == 200) {
      return WeatherModel.fromJson(json.decode(response.body));
    } else {
      return null;
    }
  }
}
