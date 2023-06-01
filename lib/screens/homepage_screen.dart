// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notification/controller/task_controller.dart';

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
  final controller = Get.put(TaskController());

  @override
  void initState() {
    controller.getTask();
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 1));
    notifyHelper = NotifyHelper();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller.getTask();
    _controller.dispose();
    super.dispose();
  }

  final dark = false.obs;
  final List<Color> _colorList = [primaryColor, pinkColor, yellowColor];
  DateTime _selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    controller.getTask();
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
          children: [
            topSection(),
            _dateSelectSection(),
            showTaskSection(),
          ],
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
                onPressed: () async {
                  await Get.toNamed('/addtask');
                  // controller.getTask();
                },
                icon: Icon(Icons.add)),
          ],
        ),
        // feild(controller: namecontroller)
      ],
    );
  }

  Widget showTaskSection() {
    return Expanded(
      child: Obx(
        () => ListView.builder(
            itemCount: controller.taskList.length,
            itemBuilder: (context, index) {
              var colorIndex = controller.taskList[index].color;
              var taskList = controller.taskList[index];
              return Container(
                margin: EdgeInsets.only(right: 20, left: 20, top: 10),
                height: 100,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: _colorList[colorIndex]),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 10, top: 10, bottom: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            taskList.title,
                            style: buttonText,
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.access_time_rounded,
                                size: 13,
                                color: Colors.white,
                              ),
                              Text(
                                ' ${taskList.startTime}',
                                style: buttonText,
                              ),
                              Text(
                                ' - ${taskList.endTime}',
                                style: buttonText,
                              )
                            ],
                          ),
                          Text(
                            taskList.note,
                            style: buttonText,
                          )
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(right: 10),
                      child: Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(right: 4),
                            height: 70,
                            width: 0.5,
                            color: Colors.grey[200],
                          ),
                          RotatedBox(
                            quarterTurns: 3,
                            child: Text(
                              taskList.isCompleted == 1 ? "COMPLETED" : "TODO",
                              style: buttonText,
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              );
            }),
      ),
    );
  }
}
