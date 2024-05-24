import 'package:shared_preferences/shared_preferences.dart';

class AppPreferences {
  static SharedPreferences? _preferences;
  static const _themeKey = 'themeKey';
  static const _loginKey = 'loginKeyKey';
   static const _apiKey = 'apiKeyKey';
  static Future init() async =>
      _preferences = await SharedPreferences.getInstance();

  static Future setTheme(String theme) async =>
      _preferences!.setString(_themeKey, theme);
  static String? getTheme()  => _preferences!.getString(_themeKey);

    static Future setLogin(bool login) async =>
      _preferences!.setBool(_loginKey, login);
  static bool? getLogin()  => _preferences!.getBool(_loginKey);

   static Future setApiKey(String key) async =>
      _preferences!.setString(_apiKey, key);
  static String? getApiKey()  => _preferences!.getString(_apiKey);
}