import 'package:get/get.dart';

import '../screens/addTask_screen.dart';
import '../screens/homepage_screen.dart';

final List<GetPage> routeService = [
  GetPage(
    name: '/',
    page: () => const HomePage(),
  ),
  GetPage(
    name: '/addtask',
    page: () => const AddTaskScreen(),
  )
];
