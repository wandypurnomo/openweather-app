import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:get_it/get_it.dart';
import 'package:openweather/core/home/repositories/weather_repository.dart';
import 'package:openweather/model/weather.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc() : super(WeatherInitial());

  WeatherRepository get _repository => GetIt.I<WeatherRepository>();

  @override
  Stream<WeatherState> mapEventToState(
    WeatherEvent event,
  ) async* {
    if (event is GetInitialWeather) {
      yield WeatherLoading();

      try {
        final lastSearch = await _repository.lastSearchText();
        if (lastSearch == null || lastSearch == '')
          throw Exception('No last search');

        final currentWeather = await _repository.currentWeather(lastSearch);
        final forecast = await _repository.forecast(lastSearch);
        await _repository.persistsSearchText(lastSearch);

        yield WeatherLoaded(currentWeather, forecast, lastSearch: lastSearch);
      } catch (e) {
        yield WeatherError(e.toString());
      }
    }
    if (event is GetWeatherByCity) {
      yield WeatherLoading();

      try {
        final currentWeather = await _repository.currentWeather(event.city);
        final forecast = await _repository.forecast(event.city);
        await _repository.persistsSearchText(event.city);

        yield WeatherLoaded(currentWeather, forecast);
      } catch (e) {
        print(e.toString());
        yield WeatherError(e.toString());
      }
    }
  }
}
