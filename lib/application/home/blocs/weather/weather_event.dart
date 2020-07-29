part of 'weather_bloc.dart';

abstract class WeatherEvent extends Equatable {
  const WeatherEvent();
}

class GetWeatherByCity extends WeatherEvent {
  final String city;

  GetWeatherByCity(this.city);

  @override
  List<Object> get props => [city];
}

class GetInitialWeather extends WeatherEvent {
  @override
  List<Object> get props => [];
}
