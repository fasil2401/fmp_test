import 'package:shared_preferences/shared_preferences.dart';

class AppPreferences {
  static SharedPreferences? _preferences;
  static const _themeKey = 'themeKey';
  static Future init() async =>
      _preferences = await SharedPreferences.getInstance();

  static Future setTheme(String theme) async =>
      _preferences!.setString(_themeKey, theme);
  static String? getTheme()  => _preferences!.getString(_themeKey);
}