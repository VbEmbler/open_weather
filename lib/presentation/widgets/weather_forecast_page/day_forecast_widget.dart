import 'package:flutter/material.dart';
import 'package:open_weather/models/days_weather_forecast_model.dart';
import 'package:open_weather/presentation/widgets/weather_forecast_page/humidity_row.dart';
import 'package:open_weather/presentation/widgets/weather_forecast_page/min_max_temperature_row.dart';
import 'package:open_weather/presentation/widgets/weather_forecast_page/pressure_row.dart';
import 'package:open_weather/presentation/widgets/weather_forecast_page/temperature_row.dart';
import 'package:open_weather/presentation/widgets/weather_forecast_page/weather_description.dart';
import 'package:open_weather/presentation/widgets/weather_forecast_page/wind_speed_row.dart';

class DayForecastWidget extends StatelessWidget {
  final DaysWeatherForecastModel dayForecast;
  final String? iconUrl;

  const DayForecastWidget({
    required this.dayForecast,
    this.iconUrl,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 50),
        Text(
          dayForecast.dayWeatherList![0].dtTxt.toString().substring(0, 10),
          style: const TextStyle(
            fontSize: 38.0,
            color: Colors.black87
          ),
        ),
        const SizedBox(height: 15),
        TemperatureRow(dayForecast: dayForecast),
        const SizedBox(height: 10),
        MinMaxTemperatureRow(dayForecast: dayForecast),
        WeatherDescription(iconUrl: iconUrl, dayForecast: dayForecast),
        HumidityRow(dayForecast: dayForecast),
        const SizedBox(height: 5),
        WindSpeedRow(dayForecast: dayForecast),
        const SizedBox(height: 5),
        PressureRow(dayForecast: dayForecast)
      ],
    );
  }
}











