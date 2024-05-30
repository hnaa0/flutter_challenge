import 'package:assignment_9/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'POMOTIMER',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xFF375778),
        scaffoldBackgroundColor: const Color(0xffa4c4ed),
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xffa4c4ed),
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 20,
            letterSpacing: 1.5,
            fontWeight: FontWeight.w500,
          ),
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            backgroundColor: Colors.white,
            foregroundColor: const Color(0xFF375778),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
        iconButtonTheme: IconButtonThemeData(
          style: IconButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: const Color(0xFF213448),
          ),
        ),
      ),
      home: const HomeScreen(),
    );
  }
}
