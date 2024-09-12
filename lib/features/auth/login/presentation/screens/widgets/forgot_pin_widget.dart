import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:uis_attendance/app/app_localization.dart';
import 'package:uis_attendance/core/utils/app_colors.dart';
import 'package:uis_attendance/core/utils/app_router.dart';

class ForgotPinWidget extends StatelessWidget {
  const ForgotPinWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Text(
        "forgotPin".tr(context),
        style: TextStyle(fontSize: 12, color: AppColors.kPrimaryColor),
      ),
      TextButton(
          onPressed: () {
            GoRouter.of(context).push(AppRouter.kNewPin);
          },
          child: Text(
            "reset".tr(context),
            style: TextStyle(fontSize: 12, color: AppColors.kPrimaryColor),
          ))
    ]);
  }
}

