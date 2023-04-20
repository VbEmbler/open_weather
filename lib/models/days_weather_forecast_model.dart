import 'package:json_annotation/json_annotation.dart';
import 'package:open_weather/models/city_model.dart';
import 'package:open_weather/models/day_weather_model.dart';

part 'days_weather_forecast_model.g.dart';

//more info https://openweathermap.org/forecast5#5days
@JsonSerializable()
class DaysWeatherForecastModel {
  final String? cod;
  final int? message;
  final int? cnt;
  @JsonKey(name: 'list')
  final List<DayWeatherModel>? dayWeatherList;
  final CityModel? city;

  DaysWeatherForecastModel({
    this.cod,
    this.message,
    this.cnt,
    this.dayWeatherList,
    this.city,
  });

  factory DaysWeatherForecastModel.fromJson(Map<String, dynamic> json) => _$DaysWeatherForecastModelFromJson(json);
}