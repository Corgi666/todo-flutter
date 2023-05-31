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

// Widget reuseable_DropDown({required String title, required int remind}) {
//   return Container(
//     width: double.maxFinite,
//     height: 70,
//     child: Column(
//       mainAxisAlignment: MainAxisAlignment.start,
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         reuseable_TextTitle(title: title),
//         Container(
//           // padding: EdgeInsets.only(),
//           width: double.maxFinite,
//           decoration: BoxDecoration(
//               border:
//                   Border.all(color: Get.isDarkMode ? Colors.white : darkGrey)),
//           alignment: Alignment.centerRight,
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text(remind.toString()),
//               Icon(Icons.arrow_downward_outlined)
//             ],
//           ),
//         )
//       ],
//     ),
//   );
// }
