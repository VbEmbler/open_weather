class LanguageUtils {
  static String defaultLanguage = 'en';
  static const Map<String, Map<String, String>> _localizedValues = {
    'en': {
      'requestToAPIServerWasCancelled': 'Request to API server was cancelled',
      'connectionTimeoutWithAPIServer': 'Connection timeout with API server',
      'connectionToAPIServerFailedDueToInternetConnection': 'Connection to API server failed due to internet connection',
      'receiveTimeoutInConnectionWithAPIServer': 'Receive timeout in connection with API server',
      'sendTimeoutInConnectionWithAPIServer': 'Send timeout in connection with API server',
      'somethingWentWrong': 'Something went wrong',
      'badRequest': 'Bad request',
      'cityNotFound': 'City Not Found',
      'internalServerError': 'Internal server error',
      'checkYourInetConnections': 'Check your inet Connections',
      'connectionError': 'Connection error',
      'weatherForecast': 'Weather Forecast',
      'getForecast': 'Get forecast',
      'nothingToGeocode': 'Nothing to geocode',
      'errorCode': 'Error code',
      'errorMessage': 'Error message',
      'threeDayForecastAtTwelvePM': '3-day forecast at 12:00 pm.',
      'temperature': 'Temperature',
      'degreesCelsiusAbbreviation' : '°C',
      'minTemp': 'Min Temp',
      'maxTemp': 'Max Temp',
      'humidity': 'Humidity',
      'percentSign': '%',
      'windSpeed': 'Wind speed',
      'kilometerPerHourAbbreviation': 'km/h',
      'errorGettingData': 'Error getting data',
      'noDescription': 'No description',
      'feelsLike': 'Feels like',
      'city': 'City',
      'enterCity': 'Enter city',
      'noCity': 'No City',
      'weather': 'Weather',
      'pressure': 'Pressure',
      'mmHg': 'mmHg'
    },
  };

  static set language(String lang) {
    defaultLanguage = lang;
  }

  static String get requestToAPIServerWasCancelled {
    return _localizedValues[defaultLanguage]!['requestToAPIServerWasCancelled']!;
  }
  static String get connectionTimeoutWithAPIServer {
    return _localizedValues[defaultLanguage]!['connectionTimeoutWithAPIServer']!;
  }
  static String get connectionToAPIServerFailedDueToInternetConnection {
    return _localizedValues[defaultLanguage]!['connectionToAPIServerFailedDueToInternetConnection']!;
  }
  static String get receiveTimeoutInConnectionWithAPIServer {
    return _localizedValues[defaultLanguage]!['receiveTimeoutInConnectionWithAPIServer']!;
  }
  static String get sendTimeoutInConnectionWithAPIServer {
    return _localizedValues[defaultLanguage]!['sendTimeoutInConnectionWithAPIServer']!;
  }
  static String get somethingWentWrong {
    return _localizedValues[defaultLanguage]!['somethingWentWrong']!;
  }
  static String get badRequest {
    return _localizedValues[defaultLanguage]!['badRequest']!;
  }
  static String get cityNotFound {
    return _localizedValues[defaultLanguage]!['cityNotFound']!;
  }
  static String get internalServerError {
    return _localizedValues[defaultLanguage]!['internalServerError']!;
  }
  static String get checkYourInetConnections {
    return _localizedValues[defaultLanguage]!['checkYourInetConnections']!;
  }
  static String get connectionError {
    return _localizedValues[defaultLanguage]!['connectionError']!;
  }
  static String get weatherForecast {
    return _localizedValues[defaultLanguage]!['weatherForecast']!;
  }
  static String get getForecast {
    return _localizedValues[defaultLanguage]!['getForecast']!;
  }
  static String get nothingToGeocode {
    return _localizedValues[defaultLanguage]!['nothingToGeocode']!;
  }
  static String get errorCode {
    return _localizedValues[defaultLanguage]!['errorCode']!;
  }
  static String get errorMessage {
    return _localizedValues[defaultLanguage]!['errorMessage']!;
  }
  static String get threeDayForecastAtTwelvePM {
    return _localizedValues[defaultLanguage]!['threeDayForecastAtTwelvePM']!;
  }
  static String get temperature {
    return _localizedValues[defaultLanguage]!['temperature']!;
  }
  static String get degreesCelsiusAbbreviation {
    return _localizedValues[defaultLanguage]!['degreesCelsiusAbbreviation']!;
  }
  static String get minTemp {
    return _localizedValues[defaultLanguage]!['minTemp']!;
  }
  static String get maxTemp {
    return _localizedValues[defaultLanguage]!['maxTemp']!;
  }
  static String get humidity {
    return _localizedValues[defaultLanguage]!['humidity']!;
  }
  static String get percentSign {
    return _localizedValues[defaultLanguage]!['percentSign']!;
  }
  static String get windSpeed {
    return _localizedValues[defaultLanguage]!['windSpeed']!;
  }
  static String get kilometerPerHourAbbreviation {
    return _localizedValues[defaultLanguage]!['kilometerPerHourAbbreviation']!;
  }
  static String get errorGettingData {
    return _localizedValues[defaultLanguage]!['errorGettingData']!;
  }
  static String get noDescription {
    return _localizedValues[defaultLanguage]!['noDescription']!;
  }
  static String get feelsLike {
    return _localizedValues[defaultLanguage]!['feelsLike']!;
  }
  static String get city {
    return _localizedValues[defaultLanguage]!['city']!;
  }
  static String get enterCity {
    return _localizedValues[defaultLanguage]!['enterCity']!;
  }
  static String get noCity {
    return _localizedValues[defaultLanguage]!['noCity']!;
  }
  static String get weather {
    return _localizedValues[defaultLanguage]!['weather']!;
  }
  static String get pressure {
    return _localizedValues[defaultLanguage]!['pressure']!;
  }
  static String get mmHg {
    return _localizedValues[defaultLanguage]!['mmHg']!;
  }
}