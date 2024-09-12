import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uis_attendance/core/widgets/custom_app_bar.dart';
import 'package:uis_attendance/features/auth/user_data/presentation/manager/cubit/user_details_cubit.dart';
import 'package:uis_attendance/features/auth/user_data/presentation/widgets/finger_print_image.dart';
import 'package:uis_attendance/features/auth/user_data/presentation/widgets/id_number.dart';
import 'package:uis_attendance/features/auth/user_data/presentation/widgets/user_details_builder.dart';
import 'package:uis_attendance/features/auth/user_data/presentation/widgets/welcome_text.dart';

class UserDetailsScreen extends StatelessWidget {
  const UserDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserDetailsCubit(),
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              CustomAppBar(),
              SizedBox(height: 50.h),
              const FingerPrintImage(),
              const WelcomeText(),
              Padding(
                padding: EdgeInsets.all(12.h),
                child: Card(
                  elevation: 20,
                  child: Column(
                    children: [
                      SizedBox(height: 20.h),
                      const IdNumber(),
                      const UserDetailsBuilder(),
                      SizedBox(height: 20.h),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
