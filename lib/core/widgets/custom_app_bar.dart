import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:uis_attendance/core/utils/app_colors.dart';
import 'package:uis_attendance/core/utils/app_lang_state.dart';
import 'package:uis_attendance/core/utils/app_router.dart';
import 'package:uis_attendance/features/setting/manager/cubit/app_languge_cubit.dart';

// ignore: must_be_immutable
class CustomAppBar extends StatefulWidget {
  CustomAppBar({super.key, this.isManyIcons = false, this.onTap});
  bool isManyIcons = false;
  Function()? onTap;

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  bool _isLangAr = false;

  @override
  Widget build(BuildContext context) {
    return Container(
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
      child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            widget.isManyIcons
                ? GestureDetector(
                    onTap: widget.onTap,
                    child: const Icon(Icons.menu, color: Colors.white))
                : const SizedBox.shrink(),
            const Spacer(),
            const Text(
              'UIS Personal',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.w500),
            ),
            const Spacer(),
            GestureDetector(
                onTap: () {
                  BlocProvider.of<AppLangugeCubit>(context).appCurrentLang(
                      _isLangAr ? AppLangState.ar : AppLangState.en);
                  setState(() {
                    _isLangAr = !_isLangAr;
                  });
                },
                child: Text(
                  _isLangAr ? "AR" : "EN",
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                )),
            SizedBox(width: 20.w),
            widget.isManyIcons
                ? GestureDetector(
                    onTap: () {
                      GoRouter.of(context)
                          .pushReplacement(AppRouter.kUserDetailsScreen);
                    },
                    child: const Icon(Icons.logout, color: Colors.white))
                : const SizedBox.shrink(),
          ]),
    );
  }
}
