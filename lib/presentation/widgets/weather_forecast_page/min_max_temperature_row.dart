import 'package:flutter/material.dart';
import 'package:open_weather/models/days_weather_forecast_model.dart';
import 'package:open_weather/utils/language_utils.dart';

class MinMaxTemperatureRow extends StatelessWidget {
  final DaysWeatherForecastModel dayForecast;

  const MinMaxTemperatureRow({
    required this.dayForecast,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '${LanguageUtils.minTemp}: ${dayForecast.dayWeatherList?[0].main?.tempMin!} ${LanguageUtils.degreesCelsiusAbbreviation}',
          style: const TextStyle(
              fontSize: 18.0,
              color: Colors.white70
          ),
        ),
        Text(
          '${LanguageUtils.maxTemp}: ${dayForecast.dayWeatherList?[0].main?.tempMax!} ${LanguageUtils.degreesCelsiusAbbreviation}',
          style: const TextStyle(
              fontSize: 18.0,
              color: Colors.white70
          ),
        ),
      ],
    );
  }
}