import 'package:assignment_13/constants/colors.dart';
import 'package:flutter/material.dart';

abstract class ThreadsTheme {
  static ThemeData light = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    brightness: Brightness.light, // 디폴트 글자색
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.lightBlue,
      brightness: Brightness.light,
    ),
    useMaterial3: true,
    fontFamily: "Pretendard",
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
      elevation: 0,
      scrolledUnderElevation: 0,
    ),
    tabBarTheme: TabBarTheme(
      indicatorColor: const Color(
        ThemeColors.black,
      ).withOpacity(0.8),
      labelColor: Colors.black,
      unselectedLabelColor: const Color(
        ThemeColors.darkGray,
      ),
      dividerColor: const Color(
        ThemeColors.extraLightGray,
      ),
      splashFactory: NoSplash.splashFactory,
    ),
    bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: Colors.white,
      elevation: 0,
    ),
  );
  static ThemeData dark = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.lightBlue,
      brightness: Brightness.dark,
    ),
    scaffoldBackgroundColor: const Color(ThemeColors.black),
    brightness: Brightness.dark, // 디폴트 글자색
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(ThemeColors.black),
      foregroundColor: Colors.white,
      elevation: 0,
      scrolledUnderElevation: 0,
    ),
    tabBarTheme: TabBarTheme(
      indicatorColor: const Color(
        ThemeColors.extraLightGray,
      ).withOpacity(0.8),
      labelColor: Colors.white,
      unselectedLabelColor: const Color(
        ThemeColors.darkGray,
      ),
      dividerColor: const Color(
        ThemeColors.darkGray,
      ),
      splashFactory: NoSplash.splashFactory,
    ),
    bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: Color(ThemeColors.black),
      elevation: 0,
    ),
  );
}
