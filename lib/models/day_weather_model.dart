import 'package:json_annotation/json_annotation.dart';
import 'package:open_weather/models/clouds_model.dart';
import 'package:open_weather/models/main_model.dart';
import 'package:open_weather/models/weather_model.dart';
import 'package:open_weather/models/wind_model.dart';
import 'package:open_weather/utils/constants.dart';

part 'day_weather_model.g.dart';

//more info https://openweathermap.org/forecast5#5days
@JsonSerializable()
class DayWeatherModel {
  final int? dt;
  final MainModel? main;
  final List<WeatherModel>? weather;
  final CloudsModel? clouds;
  final WindModel? wind;
  final int? visibility;
  final double? pop;
  @JsonKey(name: 'dt_txt')
  final DateTime? dtTxt;

  DayWeatherModel({
    this.dt,
    this.main,
    this.weather,
    this.clouds,
    this.wind,
    this.visibility,
    this.pop,
    this.dtTxt,
  });

  factory DayWeatherModel.fromJson(Map<String, dynamic> json) => _$DayWeatherModelFromJson(json);

  //get image url for download image.
  // Weather always have 1 items with information about weather
  // for more info see https://openweathermap.org/forecast5#parameter
  String? getIconUrl() {
    if(weather?[0].icon != null) {
      return '${Constants.weatherImagesUrl}${weather![0].icon!}.png';
    }
    return null;
  }
}
