import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open_weather/bloc/day_forecast/day_forecast_bloc.dart';
import 'package:open_weather/bloc/day_forecast/day_forecast_event.dart';
import 'package:open_weather/bloc/day_forecast/day_forecast_state.dart';
import 'package:open_weather/models/days_weather_forecast_model.dart';
import 'package:open_weather/presentation/voids/voids.dart';
import 'package:open_weather/presentation/widgets/error_getting_data.dart';
import 'package:open_weather/presentation/widgets/weather_forecast_page/day_forecast_widget.dart';
import 'package:open_weather/presentation/widgets/weather_app_bar.dart';
import 'package:open_weather/utils/constants.dart';


class WeatherForecastPage extends StatelessWidget {
  const WeatherForecastPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //get city
    final String city = ModalRoute.of(context)!.settings.arguments as String;
    //retrieving a bloc instance
    DayForecastBloc forecastBloc = context.read<DayForecastBloc>();
    //get weather forecast. isDayForecast == true - get only 1 snapshot for today
    forecastBloc.add(DayForecastLoadEvent(city: city, isDayForecast: true));
    DaysWeatherForecastModel dayForecast = DaysWeatherForecastModel();

    //get snackBar Position
    final double screenHeight = MediaQuery.of(context).size.height;
    const double snackBarHeight = 40.0;
    final double snackBarPosition = screenHeight / 2 - snackBarHeight;

    return Scaffold(
        extendBodyBehindAppBar: true,
        //If isDayForecast return with IconButton
      // for navigate to ThreeDaysForecastPage
        appBar: WeatherAppBar(isDayForecast: true, city: city, context: context),
        body: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  colorFilter: ColorFilter.mode(Colors.black26, BlendMode.darken),
                  image: AssetImage(Constants.weatherForecastImage),
                  fit: BoxFit.fitHeight
              )
          ),
          child: BlocListener<DayForecastBloc, DayForecastState>(
            listener: (context, state) {
              if (state is DayForecastErrorState) {
                showSnackBar(state, snackBarPosition, context);
              }
            },
            child: BlocBuilder<DayForecastBloc, DayForecastState>(
              builder: (context, state) {
                if (state is DayForecastLoadingState) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is DayForecastLoadedState) {
                  dayForecast = state.daysWeatherForecastModel;
                  String? iconUrl = dayForecast.dayWeatherList![0].getIconUrl();
                  return Padding(
                    padding: const EdgeInsets.only(left: 16.0, top: 120.0, right: 16.0),
                    child: DayForecastWidget(dayForecast: dayForecast, iconUrl: iconUrl),
                  );
                } else if (state is DayForecastErrorState) {
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


