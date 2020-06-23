class WeatherModel {
  Coord coord;
  List<Weather> weather;
  Main main;
  Wind wind;
  Clouds clouds;
  num dt;
  Sys sys;
  num id;
  String name;
  num cod;

  WeatherModel({
    this.coord,
    this.weather,
    this.main,
    this.wind,
    this.clouds,
    this.dt,
    this.sys,
    this.id,
    this.name,
    this.cod,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) => WeatherModel(
        coord: Coord.fromJson(json["coord"]),
        weather: List<Weather>.from(
          json["weather"].map(
            (x) => Weather.fromJson(x),
          ),
        ),
        main: Main.fromJson(json["main"]),
        wind: Wind.fromJson(json["wind"]),
        clouds: Clouds.fromJson(json["clouds"]),
        dt: json["dt"],
        sys: Sys.fromJson(json["sys"]),
        id: json["id"],
        name: json["name"],
        cod: json["cod"],
      );
}

class Clouds {
  num all;

  Clouds({
    this.all,
  });

  factory Clouds.fromJson(Map<String, dynamic> json) => Clouds(
        all: json["all"],
      );
}

class Coord {
  num lon;
  num lat;

  Coord({
    this.lon,
    this.lat,
  });

  factory Coord.fromJson(Map<String, dynamic> json) => Coord(
        lon: json["lon"],
        lat: json["lat"],
      );
}

class Main {
  num temp;
  num pressure;
  num humidity;
  num tempMin;
  num tempMax;
  num seaLevel;
  num grndLevel;

  Main({
    this.temp,
    this.pressure,
    this.humidity,
    this.tempMin,
    this.tempMax,
    this.seaLevel,
    this.grndLevel,
  });

  factory Main.fromJson(Map<String, dynamic> json) => Main(
        temp: json["temp"],
        pressure: json["pressure"],
        humidity: json["humidity"],
        tempMin: json["temp_min"],
        tempMax: json["temp_max"],
        seaLevel: json["sea_level"],
        grndLevel: json["grnd_level"],
      );
}

class Sys {
  num message;
  String country;
  num sunrise;
  num sunset;

  Sys({
    this.message,
    this.country,
    this.sunrise,
    this.sunset,
  });

  factory Sys.fromJson(Map<String, dynamic> json) => Sys(
        message: json["message"],
        country: json["country"],
        sunrise: json["sunrise"],
        sunset: json["sunset"],
      );
}

class Weather {
  num id;
  String main;
  String description;
  String icon;

  Weather({
    this.id,
    this.main,
    this.description,
    this.icon,
  });

  factory Weather.fromJson(Map<String, dynamic> json) => Weather(
        id: json["id"],
        main: json["main"],
        description: json["description"],
        icon: json["icon"],
      );
}

class Wind {
  num speed;
  num deg;

  Wind({
    this.speed,
    this.deg,
  });

  factory Wind.fromJson(Map<String, dynamic> json) => Wind(
        speed: json["speed"],
        deg: json["deg"],
      );
}
