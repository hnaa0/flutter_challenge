import 'package:assignment_11/constants/colors.dart';
import 'package:assignment_11/features/auth/screens/interests_screen.dart';
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
        primaryColor: const Color(ThemeColors.twitterBlue),
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(ThemeColors.extraExtraLightGray),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(ThemeColors.extraExtraLightGray),
          scrolledUnderElevation: 0,
          elevation: 0,
          centerTitle: true,
        ),
        fontFamily: "Montserrat",
      ),
      home: const InterestsScreen(),
    );
  }
}
