import 'package:delivary_app/pages/map.page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import './config/theme_provider.dart';
import './config/theme_data.dart';
import './pages/theme_page.dart';
import './lib/pages/user/user.page.dart';
import './lib/pages/form/form.page.dart';
import 'package:get/get.dart';
import './lib/pages/login/login_page.dart';
import './lib/pages/login/login_controller.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Get.put(ThemeProvider());

    return Obx(
      () => GetMaterialApp(
        title: 'My App',
        theme: themeProvider.themeMode == ThemeMode.dark
            ? themeProvider.darkTheme
            : themeProvider.lightTheme,
        initialRoute: '/login',
        getPages: [
          GetPage(
              name: '/login',
              page: () => LoginPage(),
              binding: BindingsBuilder(() {
                Get.put(LoginController());
              })),
        ],
      ),
    );
  }
}
