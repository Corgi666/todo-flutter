// ignore_for_file: unnecessary_brace_in_string_interps, unused_import, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:intl/intl.dart';
import 'package:notification/controller/task_controller.dart';
import 'package:notification/models/task_model.dart';
import 'package:notification/utils/style_config.dart';
import 'package:notification/controller/theme_controller.dart';
import 'package:notification/widgets/const_custorm_widget.dart';
import 'package:notification/widgets/reuseable_widget.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({super.key});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  DateTime _dateSelect = DateTime.now();
  String _startTime = DateFormat("hh:mm a").format(DateTime.now()).toString();
  String _endTime = DateFormat("hh:mm a").format(DateTime.now()).toString();

  int _seletedRemind = 5;
  final List<DropdownMenuItem<int>> _remindList = [
    const DropdownMenuItem(
      value: 5,
      child: Text('5'),
    ),
    const DropdownMenuItem(
      value: 10,
      child: Text('10'),
    ),
    const DropdownMenuItem(
      value: 15,
      child: Text('15'),
    ),
    const DropdownMenuItem(
      value: 20,
      child: Text('20'),
    ),
  ];

  String _repeateSelected = 'None';
  final List<DropdownMenuItem<String>> _repeatedMenu = [
    const DropdownMenuItem(
      value: "None",
      child: Text('None'),
    ),
    const DropdownMenuItem(
      value: "Daily",
      child: Text('Daily'),
    ),
    const DropdownMenuItem(
      value: 'Weekly',
      child: Text('Weekly'),
    ),
    const DropdownMenuItem(
      value: 'Month',
      child: Text('Month'),
    ),
  ];

  final List<Color> _colorList = [primaryColor, pinkColor, yellowColor];
  int _colorSelected = 0;

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _noteController = TextEditingController();

  final taskController = Get.find<TaskController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appbar(),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Add Task',
              style: headingStyle,
            ),
            SizedBox(height: 15),
            // reuseable_TextTitle(title: 'Title')
            reuseable_Field(
                title: 'Title',
                hint: 'Enter title here',
                controller: _titleController),
            reuseable_Field(
                title: 'Note',
                hint: 'Enter note here',
                controller: _noteController),
            reuseable_Field(
              title: 'Day',
              hint: DateFormat.yMd().format(
                _dateSelect,
              ),
              widget: GestureDetector(
                onTap: () => _getDateFromeUser(),
                child: const Icon(Icons.calendar_today_outlined),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: reuseable_Field(
                      title: 'Start Time',
                      hint: _startTime,
                      widget: GestureDetector(
                        onTap: () => _getTimeFormUser(isStartTime: true),
                        child: const Icon(Icons.access_time_outlined),
                      )),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                    child: reuseable_Field(
                        title: 'End Time',
                        hint: _endTime,
                        widget: GestureDetector(
                            onTap: () => _getTimeFormUser(isStartTime: false),
                            child: Icon(Icons.access_time_outlined))))
              ],
            ),
            reuseable_Field(
              title: 'Remind',
              hint: '${_seletedRemind} minutes early',
              widget: DropdownButton(
                items: _remindList,
                onChanged: (value) => setState(() {
                  _seletedRemind = value!;
                }),
                icon: Icon(
                  Icons.arrow_drop_down_outlined,
                  color: Get.isDarkMode ? Colors.white : Colors.black,
                ),
                elevation: 0,
                style: hintStyle,
                underline: Container(height: 0),
              ),
            ),
            reuseable_Field(
              title: 'Repeat',
              hint: _repeateSelected,
              widget: DropdownButton(
                items: _repeatedMenu,
                onChanged: (value) => setState(() {
                  _repeateSelected = value!;
                }),
                icon: Icon(
                  Icons.arrow_drop_down_outlined,
                  color: Get.isDarkMode ? Colors.white : Colors.black,
                ),
                elevation: 0,
                style: hintStyle,
                underline: Container(height: 0),
              ),
            ),
            SizedBox(height: 10),
            _colorPicker(color: _colorList)
          ],
        )),
      ),
    );
  }

  AppBar _appbar() {
    return AppBar(
        leading: GestureDetector(
      onTap: () => Get.back(),
      child: Container(
        margin: EdgeInsets.all(20),
        child: Icon(
          Icons.arrow_back_ios,
          color: Get.isDarkMode ? Colors.white : Colors.black,
        ),
      ),
    ));
  }

  Widget _colorPicker({required List color}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            reuseable_TextTitle(title: 'Color'),
            Wrap(
              children: List<Widget>.generate(
                3,
                (index) => GestureDetector(
                  onTap: () => setState(() {
                    _colorSelected = index;
                  }),
                  child: Padding(
                    padding: const EdgeInsets.only(right: 10, top: 5),
                    child: CircleAvatar(
                      radius: 14,
                      backgroundColor: color[index],
                      child: _colorSelected == index
                          ? Icon(
                              Icons.done,
                              color: Colors.white,
                              size: 16,
                            )
                          : null,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
        reuseable_Button(lable: 'Crete Task', onTap: () => _validateData()),
      ],
    );
  }

  _getDateFromeUser() async {
    DateTime? _pickerDate = await showDatePicker(
      context: context,
      initialDate: _dateSelect,
      firstDate: DateTime(2021),
      lastDate: DateTime(2033),
    );
    if (_pickerDate != null) {
      setState(() {
        _dateSelect = _pickerDate;
      });
      print(_dateSelect);
    } else {
      print('null error');
    }
  }

  _getTimeFormUser({required bool isStartTime}) async {
    var _timepicker = await showTimePicker(
        initialEntryMode: TimePickerEntryMode.input,
        context: context,
        initialTime: TimeOfDay.now());
    if (_timepicker != null) {
      var timepicker = _timepicker.format(context);
      if (isStartTime) {
        setState(() {
          _startTime = timepicker;
        });
      } else if (isStartTime == false) {
        setState(() {
          _endTime = timepicker;
        });
      }
    }
  }

  _validateData() {
    if (_titleController.text.isNotEmpty && _noteController.text.isNotEmpty) {
      _addTaskToDB();
      Get.back();
    } else {
      if (_titleController.text.isEmpty && _noteController.text.isNotEmpty) {
        Get.snackbar(
          'Alert',
          'Type your Title',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor:
              Get.isDarkMode ? Colors.white : Colors.grey.withOpacity(0.5),
          icon: Icon(Icons.warning_amber_rounded),
        );
      } else if (_noteController.text.isEmpty &&
          _titleController.text.isNotEmpty) {
        Get.snackbar(
          'Alert',
          'Type your Note',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor:
              Get.isDarkMode ? Colors.white : Colors.grey.withOpacity(0.5),
          icon: Icon(Icons.warning_amber_rounded),
        );
      } else if (_titleController.text.isEmpty &&
          _noteController.text.isEmpty) {
        Get.snackbar(
          'Alert',
          'Title and Note is null',
          colorText: Get.isDarkMode ? Colors.black : Colors.white,
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor:
              Get.isDarkMode ? Colors.white : Colors.grey.withOpacity(0.5),
          icon: Icon(
            Icons.warning_amber_rounded,
            color: Get.isDarkMode ? Colors.black : Colors.white,
          ),
        );
      }
    }
  }

  _addTaskToDB() async {
    int value = await taskController.addTask(
        task: TaskModel(
            title: _titleController.text,
            note: _noteController.text,
            date: DateFormat.yMd().format(_dateSelect),
            startTime: _startTime,
            endTime: _endTime,
            color: _colorSelected,
            remind: _seletedRemind,
            repeat: _repeateSelected));
    print('My id is $value');
  }
}
