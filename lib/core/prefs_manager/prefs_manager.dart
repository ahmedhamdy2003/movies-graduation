import 'package:shared_preferences/shared_preferences.dart';

class OnBoardingPrefs {
  static const String _key = "onBoardingCompleted";

  static Future<void> setOnBoardingSeen() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_key, true);
  }

  static Future<bool> isOnBoardingSeen() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_key) ?? false;
  }
}
