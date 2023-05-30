import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notification/controller/style_config.dart';
import 'package:notification/widgets/reuseable_widget.dart';

class AddTaskScreen extends StatelessWidget {
  const AddTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController titleController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
          leading: GestureDetector(
        onTap: () => Get.back(),
        child: Container(
          margin: EdgeInsets.all(20),
          child: Icon(
            Icons.arrow_back_ios,
            color: Get.isDarkMode ? Colors.white : Colors.black,
          ),
        ),
      )),
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
                controller: titleController)
          ],
        )),
      ),
    );
  }
}
