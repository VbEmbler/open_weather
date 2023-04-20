import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:open_weather/models/days_weather_forecast_model.dart';
import 'package:open_weather/utils/language_utils.dart';

class PressureRow extends StatelessWidget {
  final DaysWeatherForecastModel dayForecast;

  const PressureRow({
    required this.dayForecast,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(
          FontAwesomeIcons.temperatureThreeQuarters,
          color: Colors.white70,
        ),
        const SizedBox(width: 2),
        Text(
          '${LanguageUtils.pressure}: ',
          style: const TextStyle(
              fontSize: 20.0,
              color: Colors.white70
          ),
        ),
        Text(
          '${(dayForecast.dayWeatherList![0].main!.pressure! * 0.750062).round()} ${LanguageUtils.mmHg}',
          style: const TextStyle(
              fontSize: 20.0,
              color: Colors.white70
          ),
        ),
      ],
    );
  }
}
