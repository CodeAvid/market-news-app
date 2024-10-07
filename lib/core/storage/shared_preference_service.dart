import 'package:market_news_app/app/app_local_storage.dart';
import 'package:market_news_app/app/app_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceService extends AppLocalStorage {
  SharedPreferenceService({
    SharedPreferences? storage,
  }) : _storage = storage ?? sharedPreferences;

  SharedPreferences _storage;

  @override
  Future<bool?> getBool(String key) async {
    return _storage.getBool(key);
  }

  @override
  Future<String?> getString(String key) async {
    return _storage.getString(key);
  }

  @override
  Future<bool> has(String key) async {
    return _storage.containsKey(key);
  }

  @override
  Future<bool> set(String key, String data) async {
    return _storage.setString(key, data);
  }

  @override
  Future<bool> setBool(String key, {bool data = false}) async {
    return _storage.setBool(key, data);
  }

  @override
  Future<bool> clear() async {
    return _storage.clear();
  }
}
