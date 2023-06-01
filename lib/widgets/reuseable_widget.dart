import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notification/utils/style_config.dart';
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
    Widget? widget,
    TextEditingController? controller}) {
  return Container(
    margin: const EdgeInsets.only(top: 16),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        reuseable_TextTitle(title: title),
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            Expanded(
              child: TextFormField(
                readOnly: widget != null,
                autocorrect: false,
                controller: controller,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                          color: Get.isDarkMode ? darkGrey : Colors.white),
                    ),
                    enabledBorder: widget != null
                        ? UnderlineInputBorder(
                            borderSide: BorderSide(
                                color:
                                    Get.isDarkMode ? darkGrey : Colors.white),
                          )
                        : null,
                    hintText: hint,
                    hintStyle: hintStyle),
              ),
            ),
            if (widget != null) widget
          ],
        )
      ],
    ),
  );
}

Widget reusable_button_BottomSheet(
    {VoidCallback? onPressed, required String text}) {
  return TextButton(
      onPressed: onPressed,
      child: Container(
        height: 40,
        width: double.maxFinite,
        margin: EdgeInsets.symmetric(horizontal: 15),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: text == 'Task Completed'
              ? blueColor
              : text == 'Delete Task'
                  ? pinkColor
                  : Colors.white,
          border: text == 'Close' ? Border.all(color: Colors.black) : null,
        ),
        child: Text(
          text,
          style: text == 'Close'
              ? GoogleFonts.lato(fontSize: 13, color: Colors.black)
              : buttonText,
        ),
      ));
}
