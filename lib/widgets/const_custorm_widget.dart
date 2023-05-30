import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

Widget dateNow() {
  return Text(DateFormat.yMMMMd().format(DateTime.now()));
}

// Widget feild({required TextEditingController controller}) {
//   return TextField(
//     controller: controller,
//   );
// }
