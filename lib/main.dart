// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notification/screens/homepage_screen.dart';

import 'controller/theme_controller.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // print(themes.themeToggle);
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Notification App',
      home: HomePage(),
      theme: Themes.light,
      darkTheme: Themes.dark,
    );
  }
}
