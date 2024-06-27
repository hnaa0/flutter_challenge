// view model : data와 ui 연결

import 'package:assignment_13/features/settings/models/settings_theme_mode_model.dart';
import 'package:assignment_13/features/settings/repos/settings_theme_mode_repo.dart';
import 'package:flutter/material.dart';

class SettingsThemeModeViewModel extends ChangeNotifier {
  final SettingsThemeModeRepository _repository;
  late final SettingsThemeModeModel _model = SettingsThemeModeModel(
    darkMode: _repository.isDarkMode(),
  );

  SettingsThemeModeViewModel(this._repository);

  bool get darkMode => _model.darkMode;

  void toggleThemeMode(bool value) {
    _model.darkMode = value;
    _repository.setThemeMode(value);
    notifyListeners();
  }
}
