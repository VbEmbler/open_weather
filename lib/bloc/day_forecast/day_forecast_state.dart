import 'package:open_weather/bloc/states.dart';
import 'package:open_weather/models/days_weather_forecast_model.dart';

abstract class DayForecastState {}

//no data
class DayForecastEmptyState extends DayForecastState {}

//loading data
class DayForecastLoadingState extends DayForecastState {}

//data loaded
class DayForecastLoadedState extends DayForecastState {
  DaysWeatherForecastModel daysWeatherForecastModel;

  DayForecastLoadedState({required this.daysWeatherForecastModel});
}

//error
class DayForecastErrorState extends DayForecastState implements ErrorState {
  @override
  int? errorCode;
  @override
  String? errorMessage;

  DayForecastErrorState({this.errorCode, this.errorMessage});
}