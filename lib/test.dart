import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(TestController());

    return Scaffold(
        body: Obx(() => controller.check() == RxBool(true)
            ? const Text('True')
            : const CircularProgressIndicator()));
  }
}

class TestController extends GetxController {
  RxBool check() {
    return true.obs;
  }
}
