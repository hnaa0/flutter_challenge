import 'package:assignment_13/common/main_navigation_screen.dart';
import 'package:assignment_13/theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Assignment 13',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: ThreadsTheme.light,
      darkTheme: ThreadsTheme.dark,
      home: const MainNavigationScreen(),
    );
  }
}
