import 'package:flutter/material.dart';
import 'package:open_weather/models/day_weather_model.dart';
import 'package:open_weather/presentation/widgets/three_days_forecast_page/three_days_min_temperature_row.dart';
import 'package:open_weather/presentation/widgets/three_days_forecast_page/three_days_temperature_row.dart';
import 'package:open_weather/presentation/widgets/weather_icon.dart';
import 'package:open_weather/utils/language_utils.dart';

class ThreeDaysListView extends StatelessWidget {
  final List<DayWeatherModel> dayForecastList;

  const ThreeDaysListView({required this.dayForecastList, super.key});

  @override
  Widget build(BuildContext context) {
    return MediaQuery.removePadding(
      removeTop: true,
      context: context,
      child: ListView.builder(
        itemBuilder: (context, index) {
          var iconUrl = dayForecastList[index].getIconUrl();
          return Card(
            elevation: 5,
            color: Colors.black38,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    alignment: Alignment.center,
                    child: ThreeDaysMinTemperatureRow(
                        index: index,
                        dayForecastList: dayForecastList
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: Text(
                      dayForecastList[index].dtTxt.toString().substring(0, 10),
                      style: const TextStyle(
                          fontSize: 20.0,
                          color: Colors.white70
                      ),
                    ),
                  ),
                  ListTile(
                    contentPadding:const EdgeInsets.only(left: 75.0),

                    leading: WeatherIcon(iconUrl: iconUrl),
                    title: Text(
                        dayForecastList[index].weather![0].description ?? LanguageUtils.noDescription,
                      style: const TextStyle(
                          color: Colors.white70
                      ),
                    ),
                    subtitle: Row(
                      children: [
                        Text(
                          '${LanguageUtils.windSpeed}: ',
                          style: const TextStyle(
                              color: Colors.white70
                          ),
                        ),
                        Text(
                          dayForecastList[index].wind!.speed.toString(),
                          style: const TextStyle(
                              color: Colors.white70
                          ),
                        ),
                      ],
                    ),
                  ),
                  ThreeDaysTemperatureRow(dayForecastList: dayForecastList, index: index),
                ],
              ),
            ),
          );
        },
        itemCount: dayForecastList.length,
      ),
    );
  }
}




