import 'package:openweather/infrastructure/extensions/app_database.dart';
import 'package:sembast/sembast.dart';

class WeatherDao {
  static const String STORE = 'last_search';
  final _store = intMapStoreFactory.store(STORE);

  Future<Database> get _db async => await AppDatabase.instance.database;

  Future<void> persistsString(String query) async {
    await _store.delete(await _db);
    await _store.add(await _db, {'text': query});
  }

  Future<String> getString() async {
    final data = await _store.findFirst(await _db);
    if (data == null) return null;
    return data.value['text'] ?? null;
  }
}
