import 'package:openweather/application/home/data/weather_api_service.dart';
import 'package:openweather/application/home/data/weather_dao.dart';
import 'package:openweather/core/home/repositories/weather_repository.dart';
import 'package:openweather/model/weather.dart';

class WeatherImpl extends WeatherRepository {
  WeatherApiService get _service => WeatherApiService.create();
  WeatherDao get _dao => WeatherDao();

  @override
  Future<Weather> currentWeather(String city) async {
    final resp = await _service.currentWeather(city);
    if (resp.statusCode != 200) throw Exception('No data');
    final body = resp.body;
    final weather = body['weather'][0];

    Weather w = Weather();
    w.weather = weather['main'];
    w.description = weather['description'];
    w.icon = 'http://openweathermap.org/img/wn/${weather["icon"]}@2x.png';
    w.temp = body['main']['temp'] - 273.15;
    w.humidity = body['main']['humidity'];
    w.visibility = body['visibility'];
    w.wind = double.parse(body['wind']['speed'].toString());
    w.datetime = body['dt'];
    w.city = body['name'];

    return w;
  }

  @override
  Future<List<Weather>> forecast(String city) async {
    final resp = await _service.forecast(city);
    if (resp.statusCode != 200) throw Exception('No data');
    final body = resp.body['list'];

    return body.map<Weather>((json) {
      print(json);
      print('###################');
      Weather w = Weather();
      w.weather = json['weather'][0]['main'];
      w.description = json['weather'][0]['description'];
      w.icon =
          'http://openweathermap.org/img/wn/${json["weather"][0]["icon"]}@2x.png';
      w.temp = json['main']['temp'] - 273.15;
      w.humidity = json['main']['humidity'];
      w.visibility = json['visibility'];
      w.wind = double.parse(json['wind']['speed'].toString());
      w.datetime = json['dt'];
      w.dateText = json['dt_txt'];
      return w;
    }).toList();
  }

  @override
  Future<String> lastSearchText() async {
    return await _dao.getString();
  }

  @override
  Future<void> persistsSearchText(String text) async {
    await _dao.persistsString(text);
  }
}
