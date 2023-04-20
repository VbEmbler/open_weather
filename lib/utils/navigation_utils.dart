import 'package:flutter/material.dart';

void openWeatherForecastPage({required BuildContext context, required String city}) {
  Navigator.pushNamed(context, '/weatherForecast', arguments: city);
}

void openThreeDaysForecastPage({required BuildContext context, required String city}) {
  Navigator.pushNamed(context, '/threeDaysForecast', arguments: city);
}