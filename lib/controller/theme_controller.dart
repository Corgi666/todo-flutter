import 'package:flutter/material.dart';
import 'package:get/get.dart';

const Color blueColor = Color(0xFF4e5ae8);
const Color yellowColor = Color(0xFFFFB746);
const Color pinkColor = Color(0xFFff5667);
const Color white = Colors.white;
const primaryColor = blueColor;
const Color darkGrey = Color(0xFF121212);
final darkHeader = Colors.grey[800];

class Themes {
  static final light = ThemeData(
      scaffoldBackgroundColor: white,
      primaryColor: primaryColor,
      brightness: Brightness.light,
      appBarTheme: const AppBarTheme(color: white, elevation: 0));
  static final dark = ThemeData(
      scaffoldBackgroundColor: darkGrey,
      primaryColor: darkHeader,
      brightness: Brightness.dark,
      appBarTheme: const AppBarTheme(color: darkGrey, elevation: 0));
  // bool themeToggle = false;
}

class ThemeController extends GetxController {
  // final toggletheme = false.obs;
  bool _toggletheme = false;
  get toggletheme => _toggletheme;
  void ToggleTheme() {
    _toggletheme = !_toggletheme;
    update();
    print(_toggletheme);
  }
}
