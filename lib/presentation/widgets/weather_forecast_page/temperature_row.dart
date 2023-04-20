import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:open_weather/models/days_weather_forecast_model.dart';
import 'package:open_weather/utils/language_utils.dart';

class TemperatureRow extends StatelessWidget {
  final DaysWeatherForecastModel dayForecast;

  const TemperatureRow({
    required this.dayForecast,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(
          FontAwesomeIcons.temperatureFull,
          color: Colors.white70,
        ),
        const SizedBox(width: 2),
        Text(
          '${LanguageUtils.temperature} ',
          style: const TextStyle(
            fontSize: 25.0,
            color: Colors.white70
          ),
        ),
        Text(
          '${dayForecast.dayWeatherList?[0].main?.temp} ${LanguageUtils.degreesCelsiusAbbreviation}',
          style: const TextStyle(
            fontSize: 25.0,
            color: Colors.white70
          ),
        ),
      ],
    );
  }
}