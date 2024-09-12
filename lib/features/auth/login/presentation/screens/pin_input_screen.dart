import 'package:delightful_toast/delight_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:pinput/pinput.dart';
import 'package:uis_attendance/app/app_localization.dart';
import 'package:uis_attendance/core/utils/app_colors.dart';
import 'package:uis_attendance/core/utils/app_router.dart';
import 'package:uis_attendance/core/widgets/custom_toast_card.dart';
import 'package:uis_attendance/features/auth/login/presentation/manager/cubit/login_employee_cubit.dart';
import 'package:uis_attendance/features/auth/login/presentation/screens/widgets/forgot_pin_widget.dart';

class PinInputScreen extends StatelessWidget {
  const PinInputScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => LoginEmployeeCubit(),
        child: Scaffold(
          backgroundColor: Colors.grey,
          
          bottomSheet: SizedBox(
            height: 350,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(height: 30),
                Text("enterPin".tr(context),
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: AppColors.kPrimaryColor)),
                const SizedBox(height: 30),
                BlocConsumer<LoginEmployeeCubit, LoginEmployeeState>(
                  listener: (BuildContext context, LoginEmployeeState state) {
                    if (state is LoginEmployeeSucess) {
                      DelightToastBar(
                          snackbarDuration: const Duration(milliseconds: 1000),
                          autoDismiss: true,
                          builder: (context) => CustomToastCard(
                                color: Colors.green,
                                text: "loginSuccessMsg".tr(context),
                              )).show(context);

                    (context).go(AppRouter.kHomePage);
                    } else if (state is LoginEmployeeFailure) {
                      DelightToastBar(
                        autoDismiss: true,
                        builder: (context) => CustomToastCard(
                          text: "loginErrorMsg".tr(context),
                          color: const Color.fromARGB(255, 202, 16, 3),
                        ),
                      ).show(context);
                    }
                  },
                  builder: (context, state) {
                    return Pinput(
                      animationCurve: Curves.slowMiddle,
                      controller: BlocProvider.of<LoginEmployeeCubit>(context)
                          .pinNumber,
                      onCompleted: (pin) async {
                        await BlocProvider.of<LoginEmployeeCubit>(context)
                            .loginEmployee();
                      },
                    );
                  },
                ),
                const ForgotPinWidget(),
              ],
            ),
          ),
        ));
  }
}
