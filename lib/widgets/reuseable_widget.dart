import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:notification/controller/style_config.dart';
import 'package:notification/controller/theme_controller.dart';

Widget reuseable_Button({required String lable, required VoidCallback onTap}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      alignment: Alignment.center,
      width: 100,
      height: 50,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: primaryColor),
      child: Text(
        lable,
        style: buttonText,
      ),
    ),
  );
}

Widget reuseable_TextTitle({required String title}) {
  return Text(
    title,
    style: titleStyle,
  );
}

Widget reuseable_Field(
    {required String title,
    required String hint,
    TextEditingController? controller}) {
  return Container(
    margin: EdgeInsets.only(top: 16),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        reuseable_TextTitle(title: title),
        SizedBox(
          height: 10,
        ),
        TextFormField(
          autocorrect: false,
          controller: controller,
          decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              hintText: hint,
              hintStyle: hintStyle),
        )
      ],
    ),
  );
}
