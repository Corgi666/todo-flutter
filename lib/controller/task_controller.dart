import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:notification/DB/db_helper.dart';
import 'package:notification/models/task_model.dart';
import 'package:flutter/material.dart';

class TaskController extends GetxController {
  final taskList = <TaskModel>[].obs;

  @override
  void onReady() {
    // TODO: implement onReady
    getTask();
    super.onReady();
  }

  validateData(
      {required TextEditingController titleController,
      required TextEditingController noteController,
      required DateTime dateSelect,
      required String startTime,
      required String endTime,
      required int colorSelected,
      required int seletedRemind,
      required String repeateSelected}) async {
    if (titleController.text.isNotEmpty && noteController.text.isNotEmpty) {
      await addTaskToDB(
          titleController: titleController,
          noteController: noteController,
          dateSelect: dateSelect,
          startTime: startTime,
          endTime: endTime,
          colorSelected: colorSelected,
          seletedRemind: seletedRemind,
          repeateSelected: repeateSelected);
      Get.back();
    } else {
      if (titleController.text.isEmpty && noteController.text.isNotEmpty) {
        Get.snackbar(
          'Alert',
          'Type your Title',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor:
              Get.isDarkMode ? Colors.white : Colors.grey.withOpacity(0.5),
          icon: Icon(Icons.warning_amber_rounded),
        );
      } else if (noteController.text.isEmpty &&
          titleController.text.isNotEmpty) {
        Get.snackbar(
          'Alert',
          'Type your Note',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor:
              Get.isDarkMode ? Colors.white : Colors.grey.withOpacity(0.5),
          icon: Icon(Icons.warning_amber_rounded),
        );
      } else if (titleController.text.isEmpty && noteController.text.isEmpty) {
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

  addTaskToDB(
      {required TextEditingController titleController,
      required TextEditingController noteController,
      required DateTime dateSelect,
      required String startTime,
      required String endTime,
      required int colorSelected,
      required int seletedRemind,
      required String repeateSelected}) async {
    int value = await addTask(
        task: TaskModel(
            title: titleController.text,
            note: noteController.text,
            date: DateFormat.yMd().format(dateSelect),
            startTime: startTime,
            endTime: endTime,
            color: colorSelected,
            remind: seletedRemind,
            repeat: repeateSelected));
    print('My id is $value');
  }

  Future<int> addTask({TaskModel? task}) async {
    getTask();
    return await DBHelper.insert(task);
  }

  Future<void> getTask() async {
    List<Map<String, dynamic>> tasks = await DBHelper.query();
    taskList.assignAll(tasks.map((e) => TaskModel.fromJson(e)).toList());
    update();
  }

  void deleteTask({required TaskModel task}) {
    DBHelper.delete(task: task);
    update();
  }

  Future<void> complete({required TaskModel task}) async {
    print(task.id);
    await DBHelper.updateIsCompleted(task: task);
    update();
  }
}
