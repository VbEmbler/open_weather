import 'package:open_weather/data/api_statuses/api_failure.dart';
import 'package:open_weather/data/api_statuses/api_success.dart';
import 'package:open_weather/data/datasources/forecast_remote_datasource.dart';
import 'package:open_weather/platform/network_failure.dart';
import 'package:open_weather/platform/network_info.dart';
import 'package:open_weather/utils/language_utils.dart';

class WeatherForecastRepository {
  final NetworkInfo networkInfo;
  final ForecastRemoteDataSource forecastRemoteDataSource;

  WeatherForecastRepository({
    required this.networkInfo,
    required this.forecastRemoteDataSource
  });

  // get weather forecast from api.openweathermap.org/data/2.5/forecast
  //if isDayForecast get 1 timestamp for now for city
  //if !isDayForecast get Call 5 day / 3 hour forecast data from now for city
  // more info https://openweathermap.org/forecast5#geo5
  Future<Object> getWeatherForecast({
    required String city,
    required bool isDayForecast
  }) async {
    bool isConnected = await networkInfo.isConnected;
    //check internet connection
    if(isConnected) {
      try {
        ApiSuccess response = await forecastRemoteDataSource.getWeatherForecast(
            city: city, isDayForecast: isDayForecast) as ApiSuccess;
        return response;
      } on ApiFailure catch (error) {
        ApiFailure apiFailure = ApiFailure();
        if(error.code != null) {
          apiFailure = ApiFailure(code: error.code, errorResponse: error.errorResponse);
        } else {
          apiFailure = ApiFailure(errorResponse: error.errorResponse);
        }
        throw apiFailure;
      } catch (error) {
        throw ApiFailure(errorResponse: error.toString());
      }
    } else {
      throw NetworkFailure(LanguageUtils.checkYourInetConnections);
    }
  }
}
