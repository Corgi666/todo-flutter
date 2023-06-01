import 'package:get/get.dart';
import 'package:notification/DB/db_helper.dart';
import 'package:notification/models/task_model.dart';

class TaskController extends GetxController {
  @override
  void onReady() {
    // TODO: implement onReady

    super.onReady();
  }

  Future<int> addTask({TaskModel? task}) async {
    return await DBHelper.insert(task);
  }
}
