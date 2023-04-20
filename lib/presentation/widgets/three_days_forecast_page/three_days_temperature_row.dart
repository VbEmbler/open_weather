import 'package:flutter/material.dart';
import 'package:open_weather/models/day_weather_model.dart';
import 'package:open_weather/utils/language_utils.dart';

class ThreeDaysTemperatureRow extends StatelessWidget {
  final List<DayWeatherModel> dayForecastList;
  final int index;

  const ThreeDaysTemperatureRow({
    required this.dayForecastList,
    required this.index,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '${LanguageUtils.temperature}:',
          style: const TextStyle(
              fontSize: 15,
              color: Colors.white70
          ),
        ),
        const SizedBox(width: 5.0),
        Text(
          '${dayForecastList[index].main!.temp} ${LanguageUtils.degreesCelsiusAbbreviation}. ',
          style: const TextStyle(
              fontSize: 15,
              color: Colors.white70
          ),
        ),
        const SizedBox(width: 5.0),
        Text(
          '${LanguageUtils.feelsLike}:',
          style: const TextStyle(
              fontSize: 15,
              color: Colors.white70
          ),
        ),
        const SizedBox(width: 5.0),
        Text(
          '${dayForecastList[index].main!.feelsLike}',
          style: const TextStyle(
              fontSize: 15,
              color: Colors.white70
          ),
        ),
        const SizedBox(width: 5.0),
      ],
    );
  }
}