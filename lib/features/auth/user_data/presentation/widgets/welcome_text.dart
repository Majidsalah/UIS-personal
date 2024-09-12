import 'package:flutter/material.dart';
import 'package:uis_attendance/app/app_localization.dart';
import 'package:uis_attendance/core/utils/app_colors.dart';

class WelcomeText extends StatelessWidget {
  const WelcomeText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "welcome".tr(context),
          style: TextStyle(
              fontSize: 20,
              color: AppColors.kPrimaryColor,
              fontWeight: FontWeight.bold),
        ),
        Text(
          'UIS Personal',
          style: TextStyle(
              fontSize: 22,
              color: AppColors.kPrimaryColor,
              fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}
