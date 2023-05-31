import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:notification/controller/style_config.dart';
import 'package:notification/widgets/reuseable_widget.dart';

Widget dateNow() {
  return Text(
    DateFormat.yMMMMd().format(DateTime.now()),
    style: subHeadingStyle,
  );
}

Widget colorPicker({required List color, VoidCallback? ontap}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          reuseable_TextTitle(title: 'Color'),
          Wrap(
            children: List<Widget>.generate(
              3,
              (index) => GestureDetector(
                onTap: ontap,
                child: Padding(
                  padding: const EdgeInsets.only(right: 10, top: 5),
                  child: CircleAvatar(
                    child: Icon(
                      Icons.done,
                      color: Colors.white,
                      size: 16,
                    ),
                    radius: 14,
                    backgroundColor: color[index],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    ],
  );
}
