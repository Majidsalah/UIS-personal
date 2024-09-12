import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uis_attendance/app/app_localization.dart';
import 'package:uis_attendance/core/utils/app_lang_state.dart';
import 'package:uis_attendance/core/utils/app_router.dart';
import 'package:uis_attendance/core/utils/app_theme_state.dart';
import 'package:uis_attendance/features/auth/user_data/presentation/screens/user_details_screen.dart';
import 'package:uis_attendance/features/setting/manager/cubit/app_languge_cubit.dart';
import 'package:uis_attendance/features/setting/manager/cubit/app_theme_cubit.dart';

class UisAttendance extends StatelessWidget {
  const UisAttendance({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      builder: (_, child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) =>
                  AppThemeCubit()..changeTheme(ThemeState.intial),
            ),
            BlocProvider(
              create: (context) =>
                  AppLangugeCubit()..appCurrentLang(AppLangState.intial),
            ),
          ],
          child: BlocBuilder<AppThemeCubit, AppThemeState>(
            builder: (context, theme) {
              return BlocBuilder<AppLangugeCubit, AppLangugeState>(
                builder: (context, lang) {
                  return MaterialApp.router(
                    locale: Locale(lang is AppLangugeAr ? "ar" : "en"),
                    debugShowCheckedModeBanner: false,
                    routerConfig:AppRouter.router ,
                    title: 'UIS Personal',
                    theme: theme is AppThemeDark
                        ? ThemeData.dark()
                        : ThemeData.light(),
                    supportedLocales: const [Locale('en'), Locale('ar')],
                    localizationsDelegates: const [
                      AppLocalizations.delegate,
                      GlobalMaterialLocalizations.delegate,
                      GlobalWidgetsLocalizations.delegate,
                      GlobalCupertinoLocalizations.delegate
                    ],
                    localeResolutionCallback: (deviceLocale, supportedLocales) {
                      for (var locale in supportedLocales) {
                        if (deviceLocale != null &&
                            deviceLocale.languageCode == locale.languageCode) {
                          return deviceLocale;
                        }
                      }
                      return supportedLocales.first;
                    },
                  );
                },
              );
            },
          ),
        );
      },
      child: const UserDetailsScreen(),
    );
  }

 
}
