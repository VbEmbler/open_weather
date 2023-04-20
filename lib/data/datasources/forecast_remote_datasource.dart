import 'package:dio/dio.dart';
import 'package:open_weather/data/api_statuses/api_failure.dart';
import 'package:open_weather/data/api_statuses/api_success.dart';
import 'package:open_weather/data/exceptions/dio_exceptions.dart';
import 'package:open_weather/models/days_weather_forecast_model.dart';
import 'package:open_weather/utils/constants.dart';


class ForecastRemoteDataSource {

  // get weather forecast from api.openweathermap.org/data/2.5/forecast
  //if isDayForecast get 1 timestamp for now for city
  //if !isDayForecast get Call 5 day / 3 hour forecast data from now for city
  // more info https://openweathermap.org/forecast5#geo5
  Future<Object> getWeatherForecast(
      {required String city, required bool isDayForecast}) async {
    Response response;
    final dio = Dio();
    String url;
    if (isDayForecast) {
      url =
          '${Constants.weatherBaseUrl}${Constants.weatherForecastPath}?q=$city&units=metric&cnt=1&appid=${Constants.weatherAppId}';
    } else {
      url =
          '${Constants.weatherBaseUrl}${Constants.weatherForecastPath}?q=$city&units=metric&appid=${Constants.weatherAppId}';
    }
    try {
      response = await dio.get(url);
      DaysWeatherForecastModel weather = DaysWeatherForecastModel.fromJson(response.data);
      return ApiSuccess(response: weather);
      //fall through here if response status code != 200 and API return error.
      // for ex. requestToAPIServerWasCancelled, connectionTimeoutWithAPIServer, etc
    } on DioError catch (e) {
      if (e.response?.statusCode != null) {
        //if response status code != 200
        int? statusCode = e.response!.statusCode;
        String message = DioExceptions.badResponseCode(statusCode).toString();
        throw ApiFailure(code: statusCode, errorResponse: message);
      } else {
        String message = DioExceptions.fromDioError(e).toString();
        throw ApiFailure(errorResponse: message);
      }
    } catch (e) {
      throw ApiFailure(errorResponse: e.toString());
    }
  }
}
