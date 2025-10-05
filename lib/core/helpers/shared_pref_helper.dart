import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefHelper {
  // 🔒 Private constructor
  SharedPrefHelper._();

  // 🧠 Singleton instance
  static final SharedPrefHelper _instance = SharedPrefHelper._();

  // 📤 Public getter
  static SharedPrefHelper get instance => _instance;

  // ⚙️ SharedPreferences reference
  static SharedPreferences? _prefs;

  /// 🧩 Initialize SharedPreferences (called automatically if needed)
  static Future<void> _initIfNeeded() async {
    _prefs ??= await SharedPreferences.getInstance();
  }

  /// 💾 Set any type of value
  Future<void> setValue(String key, dynamic value) async {
    await _initIfNeeded();

    switch (value.runtimeType) {
      case String:
        await _prefs!.setString(key, value);
        break;
      case int:
        await _prefs!.setInt(key, value);
        break;
      case bool:
        await _prefs!.setBool(key, value);
        break;
      case double:
        await _prefs!.setDouble(key, value);
        break;
      default:
        throw Exception(
          "Unsupported type for SharedPreferences: ${value.runtimeType}",
        );
    }
  }

  /// 🔍 Typed getters
  Future<String?> getString(String key) async {
    await _initIfNeeded();
    return _prefs?.getString(key);
  }

  Future<int?> getInt(String key) async {
    await _initIfNeeded();
    return _prefs?.getInt(key);
  }

  Future<bool?> getBool(String key) async {
    await _initIfNeeded();
    return _prefs?.getBool(key);
  }

  Future<double?> getDouble(String key) async {
    await _initIfNeeded();
    return _prefs?.getDouble(key);
  }

  /// 🧹 Remove a key
  Future<void> remove(String key) async {
    await _initIfNeeded();
    await _prefs?.remove(key);
  }

  /// 🧽 Clear all stored data
  Future<void> clear() async {
    await _initIfNeeded();
    await _prefs?.clear();
  }
}
