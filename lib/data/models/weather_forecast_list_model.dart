// To parse this JSON data, do
//
//     final weatherForecastListModel = weatherForecastListModelFromJson(jsonString);

import 'dart:convert';

WeatherForecastListModel weatherForecastListModelFromJson(String str) => WeatherForecastListModel.fromJson(json.decode(str));

String weatherForecastListModelToJson(WeatherForecastListModel data) => json.encode(data.toJson());

class WeatherForecastListModel {
  final String cod;
  final List<ListElement> list;
  final int message;

  WeatherForecastListModel({
    required this.cod,
    required this.list,
    required this.message,
  });

  factory WeatherForecastListModel.fromJson(Map<String, dynamic> json) => WeatherForecastListModel(
    cod: json["cod"] ?? "",
    list: List<ListElement>.from((json["list"] ?? []).map((x) => ListElement.fromJson(x))),
    message: json["message"] ?? 1,
  );

  Map<String, dynamic> toJson() => {
    "cod": cod,
    "list": List<dynamic>.from(list.map((x) => x.toJson())),
    "message": message,
  };
}

class ListElement {

  final Main main;
  final List<Weather> weather;
  final String dtTxt;

  ListElement({
    required this.main,
    required this.weather,
    required this.dtTxt,
  });

  factory ListElement.fromJson(Map<String, dynamic> json) => ListElement(
    main: Main.fromJson(json["main"] ?? {}),
    weather: List<Weather>.from((json["weather"] ?? []).map((x) => Weather.fromJson(x))),
    dtTxt: json["dt_txt"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "main": main.toJson(),
    "weather": List<dynamic>.from(weather.map((x) => x.toJson())),
    "dt_txt": dtTxt,
  };
}

class Main {
  final double temp;
  final double tempMin;
  final double tempMax;

  Main({
    required this.temp,
    required this.tempMin,
    required this.tempMax,
  });

  factory Main.fromJson(Map<String, dynamic> json) => Main(
    temp: (json["temp"] ?? 0).toDouble(),
    tempMin: (json["temp_min"] ?? 0).toDouble(),
    tempMax: (json["temp_max"] ?? 0).toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "temp": temp,
    "temp_min": tempMin,
    "temp_max": tempMax,
  };
}

class Weather {
  final int id;
  final String main;
  final String description;
  final String icon;

  Weather({
    required this.id,
    required this.main,
    required this.description,
    required this.icon,
  });

  factory Weather.fromJson(Map<String, dynamic> json) => Weather(
    id: json["id"] ?? "",
    main: json["main"] ?? "",
    description: json["description"] ?? "",
    icon: json["icon"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "main": main,
    "description": description,
    "icon": icon,
  };
}