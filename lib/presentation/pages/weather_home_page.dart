import 'package:flutter/material.dart';
import 'package:open_weather/presentation/widgets/weather_home_page/search_widget.dart';
import 'package:open_weather/utils/constants.dart';
import 'package:open_weather/utils/language_utils.dart';

class WeatherHomePage extends StatelessWidget {
  const WeatherHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return  Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.transparent,
        title: Text(
            LanguageUtils.weatherForecast,
          style: const TextStyle(
            fontSize: 25.0,
            color: Colors.white70
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
              colorFilter: ColorFilter.mode(Colors.black26, BlendMode.darken),
                image: AssetImage(Constants.weatherForecastImage),
                fit: BoxFit.fitHeight
            )
        ),
        child: const Center(
          child: Padding(
            padding: EdgeInsets.only(top: 180.0, left: 16.0, right: 16.0),
            child: SearchWidget()
          ),
        ),
      ),
    );
  }
}
