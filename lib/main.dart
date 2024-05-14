import 'package:delivary_app/pages/map.page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import './config/theme_provider.dart';
import './config/theme_data.dart';
import './pages/theme_page.dart';
import './lib/pages/user/user.page.dart';
import './lib/pages/form/form.page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Get.put(ThemeProvider());

    return Obx(
      () => MaterialApp(
        title: 'My App',
        theme: themeProvider.themeMode == ThemeMode.dark
            ? themeProvider.darkTheme
            : themeProvider.lightTheme,
        home: FromPage(),
      ),
    );
  }
}
