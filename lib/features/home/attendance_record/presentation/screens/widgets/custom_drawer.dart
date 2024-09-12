import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:uis_attendance/app/app_localization.dart';
import 'package:uis_attendance/core/cache_helper/shared_prefrences.dart';
import 'package:uis_attendance/core/utils/app_colors.dart';
import 'package:uis_attendance/core/utils/app_images.dart';
import 'package:uis_attendance/core/utils/app_router.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({
    super.key,
  });

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  String userName = '';
  String companyName = '';

  @override
  void initState() {
    super.initState();
    _loadCompanyAndUserName();
  }

  Future<void> _loadCompanyAndUserName() async {
    String user = await ShPref.getUserName();
    String company = await ShPref.getCompanyName();
    setState(() {
      userName = user;
      companyName = company;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(children: [
        Stack(
          children: [
            Container(
              height: 75.h,
              margin: const EdgeInsets.only(
                bottom: 38,
              ),
              width: double.infinity,
              decoration: const BoxDecoration(
                  color: Color(0xff29408C),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  )),
            ),
            Positioned(
              bottom: 5.h,
              left: 124,
              child: CircleAvatar(
                backgroundColor: Colors.transparent,
                radius: 30.h,
                backgroundImage: AssetImage(AppImages.avatar),
              ),
            ),
          ],
        ),
        Center(
          child: Text(
            userName,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ),
        Center(
            child: Text(
          companyName,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: AppColors.kPrimaryColor),
        )),
        SizedBox(height: 30.h),
        ListTile(
          leading: const Icon(Icons.home),
          onTap: () {
            GoRouter.of(context).pop();
          },
          title: Text("mainPage".tr(context)),
        ),
        ListTile(
          leading: const Icon(Icons.history),
          onTap: () {
            GoRouter.of(context).push(AppRouter.kHistory);
          },
          title: Text("history".tr(context)),
        ),
        ListTile(
          leading: const Icon(Icons.settings),
          onTap: () {
            GoRouter.of(context).push(AppRouter.kSetting);
          },
          title: Text("setting".tr(context)),
        ),
      ]),
    );
  }
}
