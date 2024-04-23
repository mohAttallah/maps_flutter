import 'package:flutter/material.dart';
import 'package:maps/Pages/Weather_page.dart';
import 'package:get/get.dart';
import './Pages/Language/language_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  @override
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'GetX Example',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: LanguageView());
  }
}
