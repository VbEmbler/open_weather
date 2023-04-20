import 'package:dio/dio.dart';
import 'package:open_weather/utils/language_utils.dart';

class DioExceptions implements Exception {
  String _message = '';

  //handle error without response code
  DioExceptions.fromDioError(DioError dioError) {
    switch (dioError.type) {
      case DioErrorType.cancel:
        _message = LanguageUtils.requestToAPIServerWasCancelled;
        break;
      case DioErrorType.connectionTimeout:
        _message =  LanguageUtils.connectionTimeoutWithAPIServer;
        break;
      case DioErrorType.connectionError:
        _message = LanguageUtils.connectionToAPIServerFailedDueToInternetConnection;
        break;
      case DioErrorType.receiveTimeout:
        _message = LanguageUtils.receiveTimeoutInConnectionWithAPIServer;
        break;
      case DioErrorType.sendTimeout:
        _message = LanguageUtils.sendTimeoutInConnectionWithAPIServer;
        break;
      default:
        _message = LanguageUtils.somethingWentWrong;
        break;
    }
  }

  //handle error with response code != 200
  DioExceptions.badResponseCode(int? statusCode) {
    _message = _handleError(statusCode);
  }

  String _handleError(int? statusCode) {
    switch (statusCode) {
      case 400:
        return LanguageUtils.nothingToGeocode;
      case 404:
        return LanguageUtils.cityNotFound;
      case 500:
        return LanguageUtils.internalServerError;
      default:
        return LanguageUtils.somethingWentWrong;
    }
  }

  @override
  String toString() {
    return _message;
  }

}