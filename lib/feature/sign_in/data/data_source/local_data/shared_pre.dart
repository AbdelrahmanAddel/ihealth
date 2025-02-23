import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static late SharedPreferences sharedPreferences;
  static Future<void> init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future<void> setString(
      {required String value, required String key}) async {
    await sharedPreferences.setString(key, value);
  }

  static String getData({required String key}) {
    return sharedPreferences.getString(key) ?? 'NO VALUE';
  }
}
