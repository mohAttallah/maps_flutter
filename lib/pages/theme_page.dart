import 'package:delivary_app/config/theme_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../config/theme_provider.dart';
import '../lib/pages/user/user.page.dart';

class ThemePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Get.find<ThemeProvider>();
    return Obx(
      () => Scaffold(
        // appBar: AppBar(
        //   title: Text('Theme Page'),
        // ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                themeProvider.themeMode == ThemeMode.dark
                    ? 'Dark Mode is ON'
                    : 'Light Mode is ON',
                style: TextStyle(fontSize: 24),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: themeProvider.toggleTheme,
                child: Text(
                  themeProvider.themeMode == ThemeMode.dark
                      ? 'Switch to Light Mode'
                      : 'Switch to Dark Mode ',
                ),
              ),
              Container(
                color: Get.theme.colorScheme.primary,
                child: const Text('This is a container with the primary color'),
              ),
              Text(
                'This is some text',
                style: TextStyle(
                  color: Get.theme.colorScheme.primary,
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Get.to(UserPage());
                },
                child: Text('Go to User Page'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
