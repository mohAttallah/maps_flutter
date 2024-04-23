import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maps/Pages/Language/Langauage_Contoller.dart';

class LanguageView extends StatelessWidget {
  LanguageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LanguageController>(
      init: LanguageController(),
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Language Switcher'),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Obx(() => Text(controller.getLanguageItem('greeting'))),
                Obx(() => Text(controller.getLanguageItem('welcome'))),
                ElevatedButton(
                  onPressed: () {
                    controller.toggleLanguage();
                    controller.resetAndRestart();
                  },
                  child: const Text('Toggle Language'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
