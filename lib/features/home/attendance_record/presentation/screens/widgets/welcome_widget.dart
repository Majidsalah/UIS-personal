import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uis_attendance/app/app_localization.dart';
import 'package:uis_attendance/core/cache_helper/shared_prefrences.dart';
import 'package:uis_attendance/core/utils/app_images.dart';

class WelcomeWidget extends StatefulWidget {
  const WelcomeWidget({
    super.key,
  });

  @override
  State<WelcomeWidget> createState() => _WelcomeWidgetState();
}

class _WelcomeWidgetState extends State<WelcomeWidget> {
  String userName = '';
  void initState() {
    super.initState();
    _loadUserName();
  }

  Future<void> _loadUserName() async {
    String user = await ShPref.getUserName();

    setState(() {
      userName = user;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 20.w,
        ),
        CircleAvatar(
          backgroundColor: Colors.transparent,
          radius: 30.h,
          backgroundImage: AssetImage(AppImages.avatar),
        ),
        SizedBox(
          width: 18.w,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("welcomeBack".tr(context)),
            Text(
              '${"hello".tr(context)}, $userName 👋 ',
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            ),
          ],
        )
      ],
    );
  }
}
