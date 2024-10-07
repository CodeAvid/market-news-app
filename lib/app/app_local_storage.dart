import 'dart:async';

abstract class AppLocalStorage {
  Future<bool> has(String key);

  Future<String?> getString(String key);

  Future<bool> set(String key, String data);

  Future<bool?> getBool(String key);

  Future<bool> setBool(String key, {bool data = false});

  Future<void> clear() {
    return Future.value();
  }

  Future<bool> remove(String key) {
    return Future.value(false);
  }
}
