import 'package:flutter/material.dart';
import 'package:open_weather/models/day_weather_model.dart';
import 'package:open_weather/utils/language_utils.dart';

class ThreeDaysMinTemperatureRow extends StatelessWidget {
  final int index;
  final List<DayWeatherModel> dayForecastList;
  const ThreeDaysMinTemperatureRow({
    required this.index,
    required this.dayForecastList,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '${LanguageUtils.minTemp}: ',
          style: const TextStyle(
            fontSize: 20.0,
            color: Colors.white70
          ),
        ),
        Text(
          '${dayForecastList[index].main?.tempMin} ${LanguageUtils.degreesCelsiusAbbreviation}',
          style: const TextStyle(
            fontSize: 20.0,
              color: Colors.white70
          ),
        ),
      ],
    );
  }
}