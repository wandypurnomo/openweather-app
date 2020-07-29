import 'package:chopper/chopper.dart';
import 'package:openweather/infrastructure/constants/global.dart';
import 'package:openweather/infrastructure/helpers/client_preset.dart';

part 'weather_api_service.chopper.dart';

@ChopperApi()
abstract class WeatherApiService extends ChopperService {
  @Get(path: 'weather')
  Future<Response> currentWeather(
    @Query('q') String city, {
    @Query('appid') String appId: APP_ID,
  });

  @Get(path: 'forecast')
  Future<Response> forecast(
    @Query('q') String city, {
    @Query('appid') String appId: APP_ID,
  });

  static WeatherApiService create() {
    final client = ClientPreset.client(service: _$WeatherApiService());
    return _$WeatherApiService(client);
  }
}
