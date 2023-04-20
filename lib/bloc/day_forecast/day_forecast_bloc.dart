import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open_weather/bloc/day_forecast/day_forecast_event.dart';
import 'package:open_weather/bloc/day_forecast/day_forecast_state.dart';
import 'package:open_weather/data/api_statuses/api_failure.dart';
import 'package:open_weather/data/api_statuses/api_success.dart';
import 'package:open_weather/data/repositories/weather_forecast_repository.dart';
import 'package:open_weather/models/days_weather_forecast_model.dart';
import 'package:open_weather/platform/network_failure.dart';

class DayForecastBloc extends Bloc<DayForecastEvent, DayForecastState> {
  final WeatherForecastRepository weatherForecastRepository;

  DayForecastBloc({
    required this.weatherForecastRepository,
  }) : super(DayForecastEmptyState()) {
    on<DayForecastLoadEvent>(_loadingForecast);
  }

  //get weather forecast for today
  _loadingForecast(
      DayForecastLoadEvent event, Emitter<DayForecastState> emit) async {
    emit(DayForecastLoadingState());
    try {
      ApiSuccess response = await weatherForecastRepository.getWeatherForecast(
          city: event.city, isDayForecast: event.isDayForecast) as ApiSuccess;

      DaysWeatherForecastModel weatherForecastModel = response.response as DaysWeatherForecastModel;
      emit(DayForecastLoadedState(daysWeatherForecastModel: weatherForecastModel));
    } on ApiFailure catch (error) {
      emit(DayForecastErrorState(errorCode: error.code, errorMessage: error.errorResponse));
    } on NetworkFailure catch (error) {
      emit(DayForecastErrorState(errorMessage: error.error));
    } catch (error) {
      emit(DayForecastErrorState(errorMessage: error.toString()));
    }
  }
}
