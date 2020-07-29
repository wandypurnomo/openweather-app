part of 'weather_bloc.dart';

abstract class WeatherState extends Equatable {
  const WeatherState();
}

class WeatherInitial extends WeatherState {
  @override
  List<Object> get props => [];
}

class WeatherLoading extends WeatherState {
  @override
  List<Object> get props => [];
}

class WeatherLoaded extends WeatherState {
  final Weather currentWeather;
  final List<Weather> forecast;
  final String lastSearch;

  WeatherLoaded(this.currentWeather, this.forecast, {this.lastSearch: ''});
  @override
  List<Object> get props => [currentWeather, forecast, lastSearch];
}

class WeatherError extends WeatherState {
  final String reason;

  WeatherError(this.reason);
  @override
  List<Object> get props => [reason];
}
