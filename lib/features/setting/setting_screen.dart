import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uis_attendance/app/app_localization.dart';
import 'package:uis_attendance/features/setting/widgets/languge_change_widget.dart';
import 'package:uis_attendance/features/setting/widgets/theme_change_widget.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.h),
        child: Column(
          children: [
            SizedBox(height: 40.h),
            Center(
                child: Text(
              "setting".tr(context),
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            )),
            SizedBox(height: 20.h),
            const ThemeChangeWidget(),
            const LangugeChangeWidget()
          ],
        ),
      ),
    );
  }
}
