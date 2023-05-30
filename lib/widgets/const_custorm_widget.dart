import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:notification/controller/style_config.dart';

Widget dateNow() {
  return Text(
    DateFormat.yMMMMd().format(DateTime.now()),
    style: subHeadingStyle,
  );
}

// Widget feild({required TextEditingController controller}) {
//   return TextField(
//     controller: controller,
//   );
// }
