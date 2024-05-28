import 'package:assignment_7/main_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Assginment 7",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xFF03AED2),
        scaffoldBackgroundColor: Colors.grey.shade100,
        useMaterial3: true,
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            iconColor: const Color(0xFF03AED2),
          ),
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.grey.shade100,
        ),
      ),
      home: const MainScreen(),
    );
  }
}
