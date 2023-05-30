import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notification/screens/homepage_screen.dart';

import 'controller/theme_controller.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // print(themes.themeToggle);
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Notification App',
      home: const HomePage(),
      themeMode: ThemeMode.system, //theme like system
      theme: Themes.light, //Theme form theme_controller
      darkTheme: Themes.dark, //Theme form theme_controller
    );
  }
}
