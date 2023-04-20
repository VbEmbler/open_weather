abstract class DayForecastEvent {}

//load data from API
class DayForecastLoadEvent extends DayForecastEvent {
  final String city;
  final bool isDayForecast;

  DayForecastLoadEvent({required this.city,required this.isDayForecast});
}