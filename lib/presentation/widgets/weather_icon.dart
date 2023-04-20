import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:open_weather/utils/constants.dart';

//get weather icon from inet or load image from assets
// size used for height and width. Default 50.0
class WeatherIcon extends StatelessWidget {
  final String? iconUrl;
  final double size;
  const WeatherIcon({this.iconUrl, this.size = 50.0, super.key});

  @override
  Widget build(BuildContext context) {
    return iconUrl != null
        ? Image.network(
            iconUrl!,
            width: size,
            height: size,
            fit: BoxFit.fill,
          )
        : SizedBox(
            height: size,
            width: size,
            child: SvgPicture.asset(Constants.noWeatherImage),
          );
  }
}
