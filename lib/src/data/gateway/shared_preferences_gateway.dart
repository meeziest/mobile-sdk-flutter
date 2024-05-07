import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@LazySingleton()
class SharedPreferencesGateway {
  late SharedPreferences _preferences;

  Future<void> clearPreferences() async {
    await _preferences.clear();
  }

  Future<void> delete(String key) async {
    await _preferences.remove(key);
  }

  Future<void> init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  Future<String>? getFromDisk<T>(String key) async {
    final value = _preferences.get(key);
    return value.toString();
  }

  Future<void> saveToDisk<T>(String key, T value) async {
    if (value is String) {
      await _preferences.setString(key, value);
      return;
    }
    if (value is bool) {
      await _preferences.setBool(key, value);
      return;
    }
    if (value is int) {
      await _preferences.setInt(key, value);
      return;
    }
    if (value is double) {
      await _preferences.setDouble(key, value);
      return;
    }
    if (value is List<String>) {
      await _preferences.setStringList(key, value);
      return;
    }
    throw UnsupportedError('Type $T is not supported by Shared Preferences');
  }

  Future<void> saveDeviceId(String deviceId) async {
    await saveToDisk('deviceId', deviceId);
  }

  Future<String?> readDeviceId() async {
    return await getFromDisk('deviceId');
  }

  Future<void> saveUserId(String userId) async {
    await saveToDisk('userId', userId);
  }

  Future<String?> readUserId() async {
    return await getFromDisk('userId');
  }

  Future<void> saveChatId(String chatId) async {
    await saveToDisk('chatId', chatId);
  }

  Future<void> deleteChatId() async {
    await delete('chatId');
  }
}
