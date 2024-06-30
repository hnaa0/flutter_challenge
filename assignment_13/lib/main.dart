import 'package:assignment_13/features/settings/repos/settings_theme_mode_repo.dart';
import 'package:assignment_13/features/settings/view_models/theme_mode_view_model.dart';
import 'package:assignment_13/firebase_options.dart';
import 'package:assignment_13/router.dart';
import 'package:assignment_13/theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // flutter 엔진 초기화 보장

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  final preferences = await SharedPreferences.getInstance();
  final repository = SettingsThemeModeRepository(preferences);

  runApp(
    ProviderScope(
      overrides: [
        settingsThemeModeProvider.overrideWith(
          () => SettingsThemeModeViewModel(repository),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDark = ref.watch(settingsThemeModeProvider).darkMode;
    return MaterialApp.router(
      routerConfig: ref.watch(routerProvider),
      title: 'Assignment 13',
      debugShowCheckedModeBanner: false,
      themeMode: isDark ? ThemeMode.dark : ThemeMode.light,
      theme: ThreadsTheme.light,
      darkTheme: ThreadsTheme.dark,
    );
  }
}
