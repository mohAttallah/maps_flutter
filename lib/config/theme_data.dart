import 'package:flutter/material.dart';

class CustomThemeData {
  final Color customColorLight;
  final Color customColorDark;
  final ThemeData lightTheme;
  final ThemeData darkTheme;

  CustomThemeData({
    required this.customColorLight,
    required this.customColorDark,
    ThemeData? lightTheme,
    ThemeData? darkTheme,
  })  : lightTheme = lightTheme ??
            ThemeData(
              colorScheme: ColorScheme.fromSwatch(
                primarySwatch: Colors.red,
                // Other colors...
              ),
              primaryColor: customColorLight,
              secondaryHeaderColor: AppThemeData.secondary,
              backgroundColor: AppThemeData.background,
              scaffoldBackgroundColor: Colors.white,
              appBarTheme: AppBarTheme(
                backgroundColor: customColorLight,
                foregroundColor: Colors.white,
              ),
              floatingActionButtonTheme: FloatingActionButtonThemeData(
                backgroundColor: AppThemeData.secondary,
                foregroundColor: Colors.white,
              ),
              elevatedButtonTheme: ElevatedButtonThemeData(
                style: ElevatedButton.styleFrom(
                  backgroundColor: customColorLight,
                  foregroundColor: Colors.white,
                ),
              ),
              textTheme: TextTheme(
                bodyText2: TextStyle(color: AppThemeData.text),
              ),
            ),
        darkTheme = darkTheme ??
            ThemeData(
              primaryColor: customColorDark,
              secondaryHeaderColor: AppThemeData.accentDark,
              backgroundColor: AppThemeData.backgroundDark,
              scaffoldBackgroundColor: const Color(0xFF1E1E1E),
              appBarTheme: AppBarTheme(
                backgroundColor: customColorDark,
                foregroundColor: Colors.white,
              ),
              floatingActionButtonTheme: FloatingActionButtonThemeData(
                backgroundColor: AppThemeData.accentDark,
                foregroundColor: Colors.white,
              ),
              elevatedButtonTheme: ElevatedButtonThemeData(
                style: ElevatedButton.styleFrom(
                  backgroundColor: customColorDark,
                  foregroundColor: Colors.white,
                ),
              ),
              textTheme: TextTheme(
                bodyText2: TextStyle(color: AppThemeData.textDark),
              ),
            );
}

class AppThemeData {
  static const primary = Color(0xFF4CAF50);
  static const secondary = Color(0xFF2196F3);
  static const background = Color(0xFFFFFFFF);
  static const backgroundDark = Color(0xFF121212);
  static const text = Color(0xFF212121);
  static const textDark = Color(0xFFEEEEEE);
  static const accent = Color(0xFFFF9800);
  static const accentDark = Color(0xFFFFA726);
  static const error = Color(0xFFB00020);
  static const errorDark = Color(0xFFCF6679);

  // Define your custom colors
  static const lightOrange = Color.fromARGB(255, 102, 46, 198); // Light Orange
  static const darkOrange = Color(0xFFFF8C00); // Dark Orange

  static final customLightTheme = CustomThemeData(
    customColorLight: lightOrange,
    customColorDark: darkOrange,
  );

  static final customDarkTheme = CustomThemeData(
    customColorLight: lightOrange,
    customColorDark: darkOrange,
    darkTheme: ThemeData(
      colorScheme: ColorScheme.fromSwatch(
        primarySwatch: Colors.red,
        // Other colors...
      ),
      primaryColor: darkOrange,
      secondaryHeaderColor: accentDark,
      backgroundColor: backgroundDark,
      scaffoldBackgroundColor: const Color(0xFF1E1E1E),
      appBarTheme: AppBarTheme(
        backgroundColor: darkOrange,
        foregroundColor: Colors.white,
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: accentDark,
        foregroundColor: Colors.white,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: darkOrange,
          foregroundColor: Colors.white,
        ),
      ),
      textTheme: TextTheme(
        bodyText2: TextStyle(color: textDark),
      ),
    ),
  );
}
