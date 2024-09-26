import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:uis_attendance/app/app_localization.dart';
import 'package:uis_attendance/core/utils/app_colors.dart';
import 'package:uis_attendance/features/setting/widgets/languge_change_widget.dart';
import 'package:uis_attendance/features/setting/widgets/theme_change_widget.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
              padding: EdgeInsets.only(
                left: 30.w,
                right: 30.w,
                top: 50.h,
                bottom: 18.h,
              ),
              width: double.infinity,
              decoration: BoxDecoration(
                  color: AppColors.kPrimaryColor,
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(36),
                    bottomRight: Radius.circular(36),
                  )),
              child: Row(children: [
                IconButton(
                    onPressed: () {
                      GoRouter.of(context).pop();
                    },
                    icon: const Icon(Icons.arrow_back, color: Colors.white)),
                const Spacer(flex: 1),
                Text(
                  "setting".tr(context),
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      
                      color: Colors.white),
                ),
                const Spacer(flex: 1),
              ])),
          SizedBox(height: 20.h),
          const ThemeChangeWidget(),
          const LangugeChangeWidget()
        ],
      ),
    );
  }
}
