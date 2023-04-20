import 'package:flutter/material.dart';
import 'package:open_weather/utils/language_utils.dart';
import 'package:open_weather/utils/navigation_utils.dart';

class WeatherAppBar extends AppBar {
  final String city;
  final bool isDayForecast;
  final BuildContext context;

  WeatherAppBar(
      {required this.city,
      required this.isDayForecast,
      required this.context,
      super.key})
      : super(
          elevation: 1,
          backgroundColor: Colors.transparent,
          automaticallyImplyLeading: false,
          leading: IconButton(
              onPressed: () {
                ScaffoldMessenger.of(context).hideCurrentSnackBar();
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.backspace_outlined,
                color: Colors.white70,
              )
          ),
          title: Text(
            city.isEmpty ? LanguageUtils.noCity : city,
            style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 28.0,
                color: Colors.white70),
          ),
          centerTitle: true,
          actions: [
            isDayForecast
                ? IconButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).hideCurrentSnackBar();
                      openThreeDaysForecastPage(context: context, city: city);
                    },
                    icon: const Icon(
                      Icons.threed_rotation,
                      color: Colors.white70,
                    ))
                : const Text('')
          ],
        );
}
