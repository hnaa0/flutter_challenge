// view model : data와 ui 연결

import 'package:assignment_13/features/settings/models/settings_theme_mode_model.dart';
import 'package:assignment_13/features/settings/repos/settings_theme_mode_repo.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SettingsThemeModeViewModel extends Notifier<SettingsThemeModeModel> {
  final SettingsThemeModeRepository _repository;

  SettingsThemeModeViewModel(this._repository);

  // 위젯의 build처럼 자동으로 호출되고 무엇을 반환하든 사용자가 보게 되는 ui형태로 사용자에게 전달됨
  // = 데이터를 초기화할 수 있는 기회

  @override
  SettingsThemeModeModel build() {
    return SettingsThemeModeModel(
      darkMode: _repository.isDarkMode(),
    );
  }

// state로 데이터에 접근, 수정 가능

  void toggleThemeMode(bool value) {
    state = SettingsThemeModeModel(darkMode: value);
    _repository.setThemeMode(value);
  }
}

final settingsThemeModeProvider =
    NotifierProvider<SettingsThemeModeViewModel, SettingsThemeModeModel>(
  () => throw UnimplementedError(),
);
