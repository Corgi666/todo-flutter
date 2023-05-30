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
