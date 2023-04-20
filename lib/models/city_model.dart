import 'package:json_annotation/json_annotation.dart';

part 'city_model.g.dart';

//more info https://openweathermap.org/forecast5#5days
@JsonSerializable()
class CityModel {
  final int? id;
  final String? name;
  final String? country;
  final int? population;
  final int? timezone;
  final int? sunrise;
  final int? sunset;

  CityModel({
    this.id,
    this.name,
    this.country,
    this.population,
    this.timezone,
    this.sunrise,
    this.sunset,
  });

  factory CityModel.fromJson(Map<String, dynamic> json) => _$CityModelFromJson(json);
}