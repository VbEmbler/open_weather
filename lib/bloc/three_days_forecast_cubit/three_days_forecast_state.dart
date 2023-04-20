import 'package:open_weather/bloc/states.dart';
import 'package:open_weather/models/days_weather_forecast_model.dart';

abstract class ThreeDaysForecastState {}

//no data
class ThreeDaysForecastEmptyState extends ThreeDaysForecastState {}

//loading data
class ThreeDaysForecastLoadingState extends ThreeDaysForecastState {}

//data loaded
class ThreeDaysForecastLoadedState extends ThreeDaysForecastState {
  DaysWeatherForecastModel daysWeatherForecastModel;

  ThreeDaysForecastLoadedState({required this.daysWeatherForecastModel});
}

//error
class ThreeDaysForecastErrorState extends ThreeDaysForecastState implements ErrorState{
  @override
  int? errorCode;
  @override
  String? errorMessage;

  ThreeDaysForecastErrorState({this.errorCode, this.errorMessage});
}
