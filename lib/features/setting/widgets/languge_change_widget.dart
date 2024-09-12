import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uis_attendance/app/app_localization.dart';
import 'package:uis_attendance/core/cache_helper/shared_prefrences.dart';
import 'package:uis_attendance/core/utils/app_lang_state.dart';
import 'package:uis_attendance/features/setting/manager/cubit/app_languge_cubit.dart';

class LangugeChangeWidget extends StatefulWidget {
  const LangugeChangeWidget({super.key});

  @override
  State<LangugeChangeWidget> createState() => _LangugeChangeWidgetState();
}

class _LangugeChangeWidgetState extends State<LangugeChangeWidget> {
  int? selectedValue;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text("lang".tr(context), style: const TextStyle(fontSize: 20)),
            const SizedBox(width: 10),
            const Icon(Icons.language, size: 28),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("ar".tr(context), style: const TextStyle(fontSize: 16)),
            Radio<int>(
                value: 1,
                groupValue: checkCurrentLang(),
                onChanged: (int? value) {
                  setState(() {
                    BlocProvider.of<AppLangugeCubit>(context)
                        .appCurrentLang(AppLangState.ar);
                    selectedValue = value;
                  });
                }),
            SizedBox(width: 70.w),
            Text("eng".tr(context), style: const TextStyle(fontSize: 16)),
            Radio<int>(
              value: 2,
              groupValue: checkCurrentLang(),
              onChanged: (int? value) {
                setState(() {
                  BlocProvider.of<AppLangugeCubit>(context)
                      .appCurrentLang(AppLangState.en);
                  selectedValue = value;
                });
              },
            ),
          ],
        ),
      ],
    );
  }

  int checkCurrentLang() {
    if (ShPref.getLang() == 'ar') {
      return 1;
    } else {
      return 2;
    }
  }
}
