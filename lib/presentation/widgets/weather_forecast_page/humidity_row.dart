import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:open_weather/models/days_weather_forecast_model.dart';
import 'package:open_weather/utils/language_utils.dart';

class HumidityRow extends StatelessWidget {
  final DaysWeatherForecastModel dayForecast;

  const HumidityRow({required this.dayForecast, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(
          FontAwesomeIcons.cloudRain,
          color: Colors.white70,
        ),
        const SizedBox(width: 10),
        Text(
          '${LanguageUtils.humidity}: ',
          style: const TextStyle(
              fontSize: 20.0,
              color: Colors.white70
          ),
        ),
        Text(
          '${dayForecast.dayWeatherList?[0].main?.humidity} ${LanguageUtils.percentSign}',
          style: const TextStyle(
              fontSize: 20.0,
              color: Colors.white70
          ),
        ),
      ],
    );
  }
}