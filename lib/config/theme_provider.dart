import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'theme_data.dart';

class ThemeProvider extends GetxController {
  final _themeMode = ThemeMode.light.obs;

  ThemeMode get themeMode => _themeMode.value;

  ThemeData get lightTheme => AppThemeData.customLightTheme.lightTheme;
  ThemeData get darkTheme => AppThemeData.customDarkTheme.darkTheme;

  void toggleTheme() {
    _themeMode.value =
        _themeMode.value == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    Get.changeThemeMode(_themeMode.value);
  }
}
