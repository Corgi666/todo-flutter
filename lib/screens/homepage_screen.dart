// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notification/controller/theme_controller.dart';
import 'package:notification/services/notification_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  var notifyHelper;
  // ThemeController controller = Get.put(ThemeController());
  Themes themes = Themes();
  bool isplay = false;
  late AnimationController _controller;

  @override
  void initState() {
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 1));
    notifyHelper = NotifyHelper();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }

  final dark = false.obs;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.scaffoldBackgroundColor,
      appBar: AppBar(
        elevation: 0,
        actions: [
          Obx(
            () => IconButton(
                onPressed: () {
                  dark.value = !dark.value;
                  Get.changeThemeMode(
                      Get.isDarkMode ? ThemeMode.light : ThemeMode.dark);
                },
                icon: dark.value
                    ? Icon(Icons.wb_sunny_outlined)
                    : Icon(
                        Icons.dark_mode_outlined,
                        color: Colors.black,
                      )),
          )
        ],
      ),
      body: Column(
        children: [Text(Get.isDarkMode ? "DarkMode" : "Light Mode")],
      ),
    );
  }
}
