import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LocalStorage {
  static const FlutterSecureStorage _secureStorage = FlutterSecureStorage();

  Future<void> setString(String key, String value) async {
    await _secureStorage.write(key: key, value: value);
  }

  Future<String?> getString(String key) async {
    String? value = await _secureStorage.read(key: key);
    return value;
  }

  Future<void> delete(String key) async {
    await _secureStorage.delete(key: key);
  }

  Future<void> deleteAll() async {
    await _secureStorage.deleteAll();
  }
}
