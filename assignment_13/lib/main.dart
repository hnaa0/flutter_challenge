import 'package:assignment_13/features/settings/repos/settings_theme_mode_repo.dart';
import 'package:assignment_13/features/settings/view_models/theme_mode_view_model.dart';
import 'package:assignment_13/router.dart';
import 'package:assignment_13/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // flutter 엔진 초기화 보장
  final preferences = await SharedPreferences.getInstance();
  final repository = SettingsThemeModeRepository(preferences);

  runApp(
    ChangeNotifierProvider(
      create: (context) => SettingsThemeModeViewModel(repository),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = context.watch<SettingsThemeModeViewModel>().darkMode;
    return MaterialApp.router(
      routerConfig: router,
      title: 'Assignment 13',
      debugShowCheckedModeBanner: false,
      themeMode: isDark ? ThemeMode.dark : ThemeMode.light,
      theme: ThreadsTheme.light,
      darkTheme: ThreadsTheme.dark,
    );
  }
}
