//repo file : 데이터를 읽고 저장하는 일만

import 'package:shared_preferences/shared_preferences.dart';

class SettingsThemeModeRepository {
  static const _darkMode = "darkMode";
  final SharedPreferences _preferences;

  SettingsThemeModeRepository(this._preferences);

  Future<void> setThemeMode(bool value) async {
    _preferences.setBool(_darkMode, value);
  }

  bool isDarkMode() {
    return _preferences.getBool(_darkMode) ?? false;
  }
}
