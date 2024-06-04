import 'package:assignment_11/features/auth/initial_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tiktok',
      theme: ThemeData(
        primaryColor: const Color(0xff1DA1F2),
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xffF5F8FA),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xffF5F8FA),
          scrolledUnderElevation: 0,
          elevation: 0,
          centerTitle: true,
        ),
        fontFamily: "Montserrat",
      ),
      home: const InitialScreen(),
    );
  }
}
