import 'package:flutter/material.dart';
import 'package:movies_app/core/theme_manager/color_palette.dart';

abstract class ThemeManager {
  static ThemeData themeData = ThemeData(
    primaryColor:ColorsPallete.PrimaryColor ,
    appBarTheme: AppBarTheme(
      backgroundColor: ColorsPallete.Dark,
      centerTitle: true,
      iconTheme: IconThemeData(color: ColorsPallete.PrimaryColor),
      titleTextStyle: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w700,
        color: ColorsPallete.PrimaryColor,
      ),
    ),
    scaffoldBackgroundColor: Colors.transparent,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      backgroundColor: ColorsPallete.PrimaryColor,

      selectedIconTheme: IconThemeData(color: Colors.white),
      showSelectedLabels: true,
      selectedItemColor: Colors.white,
      selectedLabelStyle: TextStyle(
        color: Colors.white,
        fontSize: 14,
        fontWeight: FontWeight.bold,
      ),
      unselectedItemColor: Colors.black87,
      showUnselectedLabels: false,
    ),
    textTheme: TextTheme(
      headlineSmall: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w700,
        color: Colors.white,
      ),
      titleLarge: TextStyle(
        fontSize: 50,
        fontWeight: FontWeight.w700,
        color: Colors.white,
      ),
      titleMedium: TextStyle(
        fontSize: 36,
        fontWeight: FontWeight.w700,
        color: Colors.white,
      ),
      bodyLarge: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w700,
        color: Color(0xFFFEFFE8),
      ),
      bodyMedium: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w700,
        color: Color(0xFFFEFFE8),
      ),
      bodySmall: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w700,
        color: Color(0xFFFEFFE8),
      ),
    ),
  );
}


