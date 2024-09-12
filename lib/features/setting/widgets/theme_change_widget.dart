import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uis_attendance/app/app_localization.dart';
import 'package:uis_attendance/core/cache_helper/shared_prefrences.dart';
import 'package:uis_attendance/core/utils/app_images.dart';
import 'package:uis_attendance/core/utils/app_theme_state.dart';
import 'package:uis_attendance/features/setting/manager/cubit/app_theme_cubit.dart';

class ThemeChangeWidget extends StatefulWidget {
  const ThemeChangeWidget({super.key});

  @override
  State<ThemeChangeWidget> createState() => _ThemeChangeWidgetState();
}

bool checkThemeState() {
  if (ShPref.getTheme() == 'light') {
    return false;
  } else {
    return true;
  }
}

class _ThemeChangeWidgetState extends State<ThemeChangeWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(height: 30, child: Image.asset(AppImages.lightMode)),
        Switch(
          value: checkThemeState(),
          autofocus: true,
          onChanged: (value) {
            setState(() {
              BlocProvider.of<AppThemeCubit>(context)
                  .changeTheme(value ? ThemeState.dark : ThemeState.light);
            });
          
          },
        ),
        SizedBox(height: 25, child: Image.asset(AppImages.darkMode)),
        const Spacer(),
        Row(
          children: [
            Text("theme".tr(context), style: const TextStyle(fontSize: 20)),
            const SizedBox(width: 10),
            const Icon(Icons.brightness_4, size: 28),
          ],
        )
      ],
    );
  }
}
