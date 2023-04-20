import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:open_weather/bloc/day_forecast/day_forecast_bloc.dart';
import 'package:open_weather/bloc/three_days_forecast_cubit/three_days_forecast_cubit.dart';
import 'package:open_weather/data/datasources/forecast_remote_datasource.dart';
import 'package:open_weather/data/repositories/weather_forecast_repository.dart';
import 'package:open_weather/platform/network_info.dart';
import 'package:open_weather/presentation/pages/three_days_forecast_page.dart';
import 'package:open_weather/presentation/pages/weather_forecast_page.dart';
import 'package:open_weather/presentation/pages/weather_home_page.dart';
import 'package:open_weather/utils/language_utils.dart';


class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (_) => WeatherForecastRepository(
          networkInfo: NetworkInfo(InternetConnectionChecker()),
          forecastRemoteDataSource: ForecastRemoteDataSource()
      ),
      child: MultiBlocProvider(
        providers: [
          BlocProvider<DayForecastBloc>(
              create: (context) => DayForecastBloc(
                  weatherForecastRepository: context.read<WeatherForecastRepository>(),
              )
          ),
          BlocProvider<ThreeDaysForecastCubit>(
              create: (context) => ThreeDaysForecastCubit(
                  weatherForecastRepository: context.read<WeatherForecastRepository>(),
              )
          )
        ],
        child: MaterialApp(
          title: LanguageUtils.weather,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
            textSelectionTheme: const TextSelectionThemeData(
              selectionHandleColor: Colors.white70,
            ),
            useMaterial3: true,
          ),
          routes: {
            '/': (context) => const WeatherHomePage(),
            '/weatherForecast': (context) => const WeatherForecastPage(),
            '/threeDaysForecast': (context) => const ThreeDaysForecastPage(),
          },
          initialRoute: '/',
        ),
      ),
    );
  }
}
