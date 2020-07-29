import 'package:chopper/chopper.dart';
import 'package:meta/meta.dart';
import 'package:openweather/infrastructure/constants/global.dart';

class ClientPreset {
  static ChopperClient client({@required ChopperService service}) {
    return ChopperClient(
      baseUrl: BASE_URL,
      services: [service],
      interceptors: [
        HttpLoggingInterceptor(),
        HeadersInterceptor({
          "Content-Type": "application/json",
          "Accept": "application/json",
        }),
      ],
      converter: JsonConverter(),
    );
  }
}
