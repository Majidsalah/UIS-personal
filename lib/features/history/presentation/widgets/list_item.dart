import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uis_attendance/core/utils/app_images.dart';

class ListItem extends StatelessWidget {
  const ListItem({super.key, required this.record});
  final String record;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.h),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(height: 20.h, child: Image.asset(AppImages.fingerImage)),
              Row(
                children: [
                  Text(
                    formatingDate(record),
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  )
                ],
              )
            ],
          ),
          const Divider(thickness: 1)
        ],
      ),
    );
  }

  String formatingDate(String record) {
    DateTime apiDateTime = DateTime.parse(record);

    List<String> months = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec'
    ];

    String day = apiDateTime.day.toString();
    String month = months[apiDateTime.month - 1];
    String year = apiDateTime.year.toString();

    int hour = apiDateTime.hour;
    int minutes = apiDateTime.minute;
    String minute = minutes.toString().padLeft(2, '0');
    hour = hour % 12 == 0 ? 12 : hour % 12;
    String amPm = hour >= 12 ? "PM" : "AM";
    return "$month $day,$year at $hour:$minute $amPm";
  }
}
