import 'package:date_time/date_time.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open_weather/bloc/three_days_forecast_cubit/three_days_forecast_state.dart';
import 'package:open_weather/core/extensions/date_time.dart';
import 'package:open_weather/data/api_statuses/api_failure.dart';
import 'package:open_weather/data/api_statuses/api_success.dart';
import 'package:open_weather/data/repositories/weather_forecast_repository.dart';
import 'package:open_weather/models/day_weather_model.dart';
import 'package:open_weather/models/days_weather_forecast_model.dart';
import 'package:open_weather/platform/network_failure.dart';

class ThreeDaysForecastCubit extends Cubit<ThreeDaysForecastState> {
  final WeatherForecastRepository weatherForecastRepository;
  ThreeDaysForecastCubit({required this.weatherForecastRepository})
      : super(ThreeDaysForecastEmptyState());

  //Getting 5 day / 3 hour forecast data
  Future<void> loadingThreeDaysForecast(String city, bool isDayForecast) async {
    emit(ThreeDaysForecastLoadingState());
    try {
      ApiSuccess response = await weatherForecastRepository.getWeatherForecast(
          city: city, isDayForecast: isDayForecast) as ApiSuccess;
      DaysWeatherForecastModel weatherForecastModel =
          response.response as DaysWeatherForecastModel;
      emit(ThreeDaysForecastLoadedState(
          daysWeatherForecastModel: weatherForecastModel));
    } on ApiFailure catch (error) {
      emit(ThreeDaysForecastErrorState(
          errorCode: error.code, errorMessage: error.errorResponse));
    } on NetworkFailure catch (error) {
      emit(ThreeDaysForecastErrorState(errorMessage: error.error));
    } catch (error) {
      emit(ThreeDaysForecastErrorState(errorMessage: error.toString()));
    }
  }

  //Creates a list with three-day forecast at 12:00 every day
  List<DayWeatherModel> getThreeDaysForecast(
      DaysWeatherForecastModel weatherForecastModel) {
    List<DayWeatherModel> threeDaysForecast = [];
    DateTime today = DateTime.now();
    if (weatherForecastModel.dayWeatherList != null) {
      for (DayWeatherModel dayForecast
          in weatherForecastModel.dayWeatherList!) {
        DateTime forecastDate = DateTime.parse(dayForecast.dtTxt.toString());
        Time middayTime = const Time(hour: 12);
        if (!today.isDateEqual(forecastDate) &&
            forecastDate.time == middayTime) {
          threeDaysForecast.add(dayForecast);
          if (threeDaysForecast.length == 3) {
            break;
          }
        }
      }
    }
    threeDaysForecast = _sortThreeDaysForecast(threeDaysForecast);
    return threeDaysForecast;
  }

  //Moves day with min temp on first position in list
  List<DayWeatherModel> _sortThreeDaysForecast(
      List<DayWeatherModel> threeDaysForecast) {
    DayWeatherModel tempDayForecast;
    double? minTemp = threeDaysForecast[0].main?.temp ?? 0;
    int minIndex = 0;
    for (int i = 1; i < threeDaysForecast.length; i++) {
      if (threeDaysForecast[i].main!.temp! < minTemp!) {
        minTemp = threeDaysForecast[i].main?.temp ?? 0;
        minIndex = i;
      }
    }
    tempDayForecast = threeDaysForecast[minIndex];
    threeDaysForecast.removeAt(minIndex);
    threeDaysForecast.insert(0, tempDayForecast);
    return threeDaysForecast;
  }
}
