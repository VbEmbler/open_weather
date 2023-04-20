// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'day_weather_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DayWeatherModel _$DayWeatherModelFromJson(Map<String, dynamic> json) =>
    DayWeatherModel(
      dt: json['dt'] as int?,
      main: json['main'] == null
          ? null
          : MainModel.fromJson(json['main'] as Map<String, dynamic>),
      weather: (json['weather'] as List<dynamic>?)
          ?.map((e) => WeatherModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      clouds: json['clouds'] == null
          ? null
          : CloudsModel.fromJson(json['clouds'] as Map<String, dynamic>),
      wind: json['wind'] == null
          ? null
          : WindModel.fromJson(json['wind'] as Map<String, dynamic>),
      visibility: json['visibility'] as int?,
      pop: (json['pop'] as num?)?.toDouble(),
      dtTxt: json['dt_txt'] == null
          ? null
          : DateTime.parse(json['dt_txt'] as String),
    );

Map<String, dynamic> _$DayWeatherModelToJson(DayWeatherModel instance) =>
    <String, dynamic>{
      'dt': instance.dt,
      'main': instance.main,
      'weather': instance.weather,
      'clouds': instance.clouds,
      'wind': instance.wind,
      'visibility': instance.visibility,
      'pop': instance.pop,
      'dt_txt': instance.dtTxt?.toIso8601String(),
    };
