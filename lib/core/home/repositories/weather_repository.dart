import 'package:openweather/model/weather.dart';

abstract class WeatherRepository {
  Future<Weather> currentWeather(String city);
  Future<List<Weather>> forecast(String city);
  Future<String> lastSearchText();
  Future<void> persistsSearchText(String text);
}
