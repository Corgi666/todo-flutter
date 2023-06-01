// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:notification/utils/style_config.dart';
import 'package:notification/controller/theme_controller.dart';
import 'package:notification/services/notification_service.dart';
import 'package:notification/widgets/const_custorm_widget.dart';

import 'package:calendar_timeline/calendar_timeline.dart';

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
  final TextEditingController namecontroller = TextEditingController();
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
  DateTime _selectedDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.scaffoldBackgroundColor,
      appBar: AppBar(
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
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [topSection(), _dateSelectSection()],
        ),
      ),
    );
  }

  Widget _dateSelectSection() {
    return Container(
        height: 150,
        child: CalendarTimeline(
          leftMargin: 20,
          monthColor: Colors.blueGrey,
          dayColor: Colors.teal[200],
          activeDayColor: Colors.white,
          activeBackgroundDayColor: Colors.redAccent[100],
          selectableDayPredicate: (date) => date.day != 23,
          dotsColor: Color(0xFF333A47),
          initialDate: DateTime.now(),
          firstDate: DateTime(2022),
          lastDate: DateTime(2024),
          onDateSelected: (p0) {
            _selectedDate = p0;
            print(_selectedDate);
          },
        ));
  }

  Widget topSection() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        dateNow(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Tody',
              style: headingStyle,
            ),
            IconButton(
                onPressed: () => Get.toNamed('/addtask'),
                icon: Icon(Icons.add)),
          ],
        ),
        // feild(controller: namecontroller)
      ],
    );
  }
}
