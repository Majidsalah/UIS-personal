import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uis_attendance/app/app_localization.dart';
import 'package:uis_attendance/core/utils/app_colors.dart';
import 'package:uis_attendance/features/auth/user_data/presentation/manager/cubit/user_details_cubit.dart';

class IdNumber extends StatefulWidget {
  const IdNumber({
    super.key,
  });

  @override
  State<IdNumber> createState() => _IdNumberState();
}

class _IdNumberState extends State<IdNumber> {
  bool _isComplete = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _isComplete
            ? Container(
                margin: EdgeInsets.only(bottom: 20.h),
                padding: EdgeInsets.all(12.h),
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: AppColors.kPrimaryColor),
                child: GestureDetector(
                    onTap: () {
                      BlocProvider.of<UserDetailsCubit>(context)
                          .getUserDetails();
                    },
                    child: const Icon(Icons.search, color: Colors.white)),
              )
            : const SizedBox.shrink(),
        SizedBox(width: 5.w),
        Expanded(
          child: TextFormField(
            controller: BlocProvider.of<UserDetailsCubit>(context).idNumber,
            onChanged: (val) {
              if (val.length == 14) {
                _isComplete = true;
              } else {
                _isComplete = false;
              }
              setState(() {});
            },
            keyboardType: TextInputType.number,
            maxLength: 14,
            decoration: InputDecoration(
                labelText: "id".tr(context),
                prefixIcon: Icon(
                  Icons.badge,
                  color: AppColors.kPrimaryColor,
                ),
                border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8)))),
          ),
        ),
      ],
    );
  }
}
