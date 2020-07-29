import 'package:get_it/get_it.dart';
import 'package:openweather/application/home/implementations/weather_impl.dart';
import 'package:openweather/core/home/repositories/weather_repository.dart';

class Injector {
  static serviceLocator() {
    GetIt.I.registerLazySingleton<WeatherRepository>(() => WeatherImpl());
  }
}
