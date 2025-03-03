import 'package:shared_preferences/shared_preferences.dart';

class UserRepository {
  static SharedPreferences? prefs;

  static Future<void> init() async {
    prefs ??= await SharedPreferences.getInstance();
  }

  static Future<void> saveUserStateToSharedPref(
    bool value,
    String key,
  ) async {
    await prefs!.setBool(key, value);
  }

  // static Future<void> secSaveUserStateToSharedPref(
  //   String value,
  //   String key,
  // ) async {
  //   await prefs!.setString(key, value);
  // }

  // static Future<void> thirSaveUserStateToSharedPref(
  //   int value,
  //   String key,
  // ) async {
  //   await prefs!.setInt(key, value);
  // }

  static bool? getBool(String value) {
    return prefs!.getBool(value) ?? false;
  }

  // static String? getString(String value) {
  //   return prefs!.getString(value);
  // }

  // static int? getInt(String value) {
  //   return prefs!.getInt(value);
  // }
}