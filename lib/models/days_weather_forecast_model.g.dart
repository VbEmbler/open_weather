// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'days_weather_forecast_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DaysWeatherForecastModel _$DaysWeatherForecastModelFromJson(
        Map<String, dynamic> json) =>
    DaysWeatherForecastModel(
      cod: json['cod'] as String?,
      message: json['message'] as int?,
      cnt: json['cnt'] as int?,
      dayWeatherList: (json['list'] as List<dynamic>?)
          ?.map((e) => DayWeatherModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      city: json['city'] == null
          ? null
          : CityModel.fromJson(json['city'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DaysWeatherForecastModelToJson(
        DaysWeatherForecastModel instance) =>
    <String, dynamic>{
      'cod': instance.cod,
      'message': instance.message,
      'cnt': instance.cnt,
      'list': instance.dayWeatherList,
      'city': instance.city,
    };
