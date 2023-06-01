import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notification/DB/db_helper.dart';
import 'package:notification/services/route_service.dart';
import 'package:notification/utils/dependencies.dart';
import 'controller/theme_controller.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await DBHelper.initDB();

  dep();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ToDo Flutter',
      themeMode: ThemeMode.system, //theme like system
      theme: Themes.light, //Theme form theme_controller
      darkTheme: Themes.dark, //Theme form theme_controller
      getPages: routeService, //Get Route form routeService
    );
  }
}
