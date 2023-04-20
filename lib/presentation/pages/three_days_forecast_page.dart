import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open_weather/bloc/three_days_forecast_cubit/three_days_forecast_cubit.dart';
import 'package:open_weather/bloc/three_days_forecast_cubit/three_days_forecast_state.dart';
import 'package:open_weather/models/day_weather_model.dart';
import 'package:open_weather/models/days_weather_forecast_model.dart';
import 'package:open_weather/presentation/voids/voids.dart';
import 'package:open_weather/presentation/widgets/error_getting_data.dart';
import 'package:open_weather/presentation/widgets/three_days_forecast_page/three_days_list_view.dart';
import 'package:open_weather/presentation/widgets/weather_app_bar.dart';
import 'package:open_weather/utils/constants.dart';
import 'package:open_weather/utils/language_utils.dart';

class ThreeDaysForecastPage extends StatelessWidget {
  const ThreeDaysForecastPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //get city
    final String city = ModalRoute.of(context)!.settings.arguments as String;
    //retrieving a bloc instance
    ThreeDaysForecastCubit threeDaysForecastCubit = context.read<ThreeDaysForecastCubit>();
    //get weather forecast.
    // isDayForecast == false - 5 day forecast. includes weather forecast data with 3-hour step
    threeDaysForecastCubit.loadingThreeDaysForecast(city, false);

    DaysWeatherForecastModel threeDaysForecast = DaysWeatherForecastModel();
    List<DayWeatherModel> dayForecastList;

    //get snackBar Position
    final double screenHeight = MediaQuery.of(context).size.height;
    const double snackBarHeight = 40.0;
    final double snackBarPosition = screenHeight / 2 - snackBarHeight;

    return Scaffold(
        extendBodyBehindAppBar: true,
      //If !isDayForecast return without IconButton
      // for navigate to ThreeDaysForecastPage
        appBar: WeatherAppBar(isDayForecast: false, city: city, context: context),
        body: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  colorFilter: ColorFilter.mode(Colors.black26, BlendMode.darken),
                  image: AssetImage(Constants.weatherForecastImage),
                  fit: BoxFit.fitHeight
              )
          ),
          child: BlocListener<ThreeDaysForecastCubit, ThreeDaysForecastState>(
            listener: (context, state) {
              if (state is ThreeDaysForecastErrorState) {
                showSnackBar(state, snackBarPosition, context);
              }
            },
            child: BlocBuilder<ThreeDaysForecastCubit, ThreeDaysForecastState>(
              builder: (context, state) {
                if (state is ThreeDaysForecastLoadingState) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is ThreeDaysForecastLoadedState) {
                  threeDaysForecast = state.daysWeatherForecastModel;
                  dayForecastList = threeDaysForecastCubit
                      .getThreeDaysForecast(threeDaysForecast);

                  return Column(
                    children: [
                      const SizedBox(height: 120),
                      Text(
                        LanguageUtils.threeDayForecastAtTwelvePM,
                        style: const TextStyle(
                            fontSize: 25.0,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      const SizedBox(height: 20),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 0.0),
                          child: ThreeDaysListView(dayForecastList: dayForecastList),
                        ),
                      ),
                    ],
                  );
                } else if (state is ThreeDaysForecastErrorState) {
                  return const ErrorGettingData();
                }
                return const Placeholder();
              },
            ),
          ),
        )
    );
  }
}
