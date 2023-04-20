import 'package:json_annotation/json_annotation.dart';

part 'weather_model.g.dart';

//more info https://openweathermap.org/forecast5#5days
@JsonSerializable()
class WeatherModel {
  final int? id;
  final String? main;
  final String? description;
  final String? icon;

  WeatherModel({
    this.id,
    this.main,
    this.description,
    this.icon,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) => _$WeatherModelFromJson(json);
}