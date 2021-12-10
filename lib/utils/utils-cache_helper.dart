import 'package:shared_preferences/shared_preferences.dart';

// store userdata from firebase to display it in profile
class CacheHelper {
  static SharedPreferences? _preferences;
  static init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  static Future<bool> saveData(
      {required String key, required dynamic value}) async {
    if (value is String) return await _preferences!.setString(key, value);
    if (value is double) return await _preferences!.setDouble(key, value);
    if (value is int) return await _preferences!.setInt(key, value);
    return await _preferences!.setBool(key, value);
  }

  static getData({required String key}) {
    return _preferences!.get(key);
  }
}
