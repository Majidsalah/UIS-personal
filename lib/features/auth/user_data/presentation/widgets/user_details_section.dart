import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:uis_attendance/app/app_localization.dart';
import 'package:uis_attendance/core/utils/app_colors.dart';
import 'package:uis_attendance/core/utils/app_router.dart';
import 'package:uis_attendance/core/widgets/custom_button.dart';
import 'package:uis_attendance/features/auth/user_data/data/models/user_details_model.dart';

// ignore: must_be_immutable
class UserDetailsSection extends StatelessWidget {
  const UserDetailsSection({super.key, required this.user});
  final UserDetailsModel user;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        children: [
          Text(
            "userDetails".tr(context),
            style: TextStyle(
              decoration: TextDecoration.underline,
              decorationThickness: 1,
              decorationColor: AppColors.kPrimaryColor,
              fontSize: 22,
              color: AppColors.kPrimaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          Column(
            children: [
              Row(
                children: [
                  Icon(
                    Icons.person,
                    color: AppColors.kPrimaryColor,
                  ),
                  Text(
                    "${"employeeName".tr(context)} : ${user.employeeName}",
                    style: TextStyle(
                        fontSize: 14,
                        color: AppColors.kPrimaryColor,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
              Row(
                children: [
                  Icon(
                    Icons.domain,
                    color: AppColors.kPrimaryColor,
                  ),
                  Text("${"company".tr(context)}: ${user.companyName}",
                      style: TextStyle(
                          fontSize: 14,
                          color: AppColors.kPrimaryColor,
                          fontWeight: FontWeight.bold))
                ],
              ),
              Row(
                children: [
                  Icon(
                    Icons.group,
                    color: AppColors.kPrimaryColor,
                  ),
                  Text("${"department".tr(context)} : ${user.department}",
                      style: TextStyle(
                          fontSize: 14,
                          color: AppColors.kPrimaryColor,
                          fontWeight: FontWeight.bold))
                ],
              ),
              SizedBox(height: 20.h),
              CustomButton(
                  title: "login".tr(context),
                  ontap: () {
                    GoRouter.of(context).go(AppRouter.kPinInputScreen);
                  }),
            ],
          )
        ],
      ),
    );
  }
}
