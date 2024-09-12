import 'package:delightful_toast/delight_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uis_attendance/app/app_localization.dart';
import 'package:uis_attendance/core/widgets/custom_toast_card.dart';
import 'package:uis_attendance/features/auth/user_data/presentation/manager/cubit/user_details_cubit.dart';
import 'package:uis_attendance/features/auth/user_data/presentation/widgets/user_details_section.dart';

class UserDetailsBuilder extends StatelessWidget {
  const UserDetailsBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserDetailsCubit, UserDetailsState>(
      builder: (context, state) {
        if (state is UserDetailsSucess) {
          return UserDetailsSection(user: state.user);
        } else if (state is UserDetailsLoading) {
          return const CircularProgressIndicator();
        } else if (state is UserDetailsFailure) {
          DelightToastBar(
              autoDismiss: true,
              builder: (context) => CustomToastCard(
                    text: "wrongId".tr(context),
                    color: const Color.fromARGB(255, 202, 16, 3),
                  )).show(context);
        }
        return const SizedBox.shrink();
      },
    );
  }
}
