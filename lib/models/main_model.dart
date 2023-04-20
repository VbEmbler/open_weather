import 'package:json_annotation/json_annotation.dart';

part 'main_model.g.dart';

//more info https://openweathermap.org/forecast5#5days
@JsonSerializable()
class MainModel {
  final double? temp;
  @JsonKey(name: 'feels_like')
  final double? feelsLike;
  @JsonKey(name: 'temp_min')
  final double? tempMin;
  @JsonKey(name: 'temp_max')
  final double? tempMax;
  final int? pressure;
  @JsonKey(name: 'sea_level')
  final int? seaLevel;
  @JsonKey(name: 'grnd_level')
  final int? grndLevel;
  final int? humidity;
  @JsonKey(name: 'temp_kfn')
  final double? tempKf;

  MainModel({
    this.temp,
    this.feelsLike,
    this.tempMin,
    this.tempMax,
    this.pressure,
    this.seaLevel,
    this.grndLevel,
    this.humidity,
    this.tempKf,
  });

  factory MainModel.fromJson(Map<String, dynamic> json) => _$MainModelFromJson(json);
}