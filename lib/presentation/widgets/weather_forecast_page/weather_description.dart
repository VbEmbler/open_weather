import 'package:flutter/material.dart';
import 'package:open_weather/models/days_weather_forecast_model.dart';
import 'package:open_weather/presentation/widgets/weather_icon.dart';

class WeatherDescription extends StatelessWidget {
  const WeatherDescription({
    super.key,
    required this.iconUrl,
    required this.dayForecast,
  });

  final String? iconUrl;
  final DaysWeatherForecastModel dayForecast;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        WeatherIcon(iconUrl: iconUrl, size: 100.0),
        Text(
          '${dayForecast.dayWeatherList![0].weather?[0].description!}',
          style: const TextStyle(
              fontSize: 30.0,
              color: Colors.white70
          ),
        ),
      ],
    );
  }
}