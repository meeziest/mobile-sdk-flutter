import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// The `SharedPreferencesGateway` class provides a gateway for interacting with shared preferences.
///
/// This class is used to save, retrieve, and delete various types of data in shared preferences.
@LazySingleton()
final class SharedPreferencesGateway {
  /// The instance of `SharedPreferences` used to store and retrieve data.
  late SharedPreferences _preferences;

  /// Clears all preferences stored in `SharedPreferences`.
  ///
  /// This method deletes all key-value pairs stored in shared preferences.
  Future<void> clearPreferences() async {
    await _preferences.clear();
  }

  /// Deletes a specific preference identified by [key].
  ///
  /// [key] The key of the preference to be deleted.
  Future<void> delete(String key) async {
    await _preferences.remove(key);
  }

  /// Initializes the `SharedPreferences` instance.
  ///
  /// This method must be called before any other methods to ensure that the
  /// `_preferences` instance is available.
  Future<void> init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  /// Retrieves a value from shared preferences by [key].
  ///
  /// [key] The key of the preference to be retrieved.
  ///
  /// Returns a `Future` that completes with the value stored in shared preferences, or `null` if no value is found.
  Future<String?> getFromDisk<T>(String key) async {
    final value = _preferences.get(key);
    return value?.toString();
  }

  /// Saves a value to shared preferences.
  ///
  /// [key] The key under which the value is stored.
  /// [value] The value to be stored. Supported types are `String`, `bool`, `int`, `double`, and `List<String>`.
  ///
  /// Throws an `UnsupportedError` if the value type is not supported.
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

  /// Saves the device ID to shared preferences.
  ///
  /// [deviceId] The device ID to be stored.
  Future<void> saveDeviceId(String deviceId) async {
    await saveToDisk('deviceId', deviceId);
  }

  /// Reads the device ID from shared preferences.
  ///
  /// Returns a `Future` that completes with the device ID, or `null` if no value is found.
  Future<String?> readDeviceId() async {
    return await getFromDisk('deviceId');
  }

  /// Saves the application token to shared preferences.
  ///
  /// [appToken] The application token to be stored.
  Future<void> saveAppToken(String appToken) async {
    await saveToDisk('appToken', appToken);
  }

  /// Reads the application token from shared preferences.
  ///
  /// Returns a `Future` that completes with the application token, or `null` if no value is found.
  Future<String?> readAppToken() async {
    return await getFromDisk('appToken');
  }

  /// Saves the access token to shared preferences.
  ///
  /// [accessToken] The access token to be stored.
  Future<void> saveAccessToken(String accessToken) async {
    await saveToDisk('accessToken', accessToken);
  }

  /// Reads the access token from shared preferences.
  ///
  /// Returns a `Future` that completes with the access token, or `null` if no value is found.
  Future<String?> readAccessToken() async {
    return await getFromDisk('accessToken');
  }

  /// Saves the user ID to shared preferences.
  ///
  /// [userId] The user ID to be stored.
  Future<void> saveUserId(String userId) async {
    await saveToDisk('userId', userId);
  }

  /// Reads the user ID from shared preferences.
  ///
  /// Returns a `Future` that completes with the user ID, or `null` if no value is found.
  Future<String?> readUserId() async {
    return await getFromDisk('userId');
  }
}
