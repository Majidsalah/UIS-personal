import 'package:delightful_toast/delight_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:pinput/pinput.dart';
import 'package:uis_attendance/app/app_localization.dart';
import 'package:uis_attendance/core/utils/app_colors.dart';
import 'package:uis_attendance/core/utils/app_images.dart';
import 'package:uis_attendance/core/widgets/custom_button.dart';
import 'package:uis_attendance/core/widgets/custom_toast_card.dart';
import 'package:uis_attendance/features/auth/set_new_pin/presentaion/manager/cubit/new_pin_cubit.dart';

class SetNewPinScreen extends StatefulWidget {
  const SetNewPinScreen({super.key});

  @override
  State<SetNewPinScreen> createState() => _SetNewPinScreenState();
}

class _SetNewPinScreenState extends State<SetNewPinScreen> {
  final TextEditingController _firstController = TextEditingController();
  final TextEditingController _secondController = TextEditingController();
  bool isMatch = false;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewPinCubit(),
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                  height: 100.h, child: Image.asset(AppImages.pinLockImage)),
              SizedBox(height: 20.h),
              Text(
                "writeNewPin".tr(context),
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: AppColors.kPrimaryColor),
              ),
              SizedBox(height: 50.h),
              Align(
                alignment: Alignment.center,
                child: Text(
                  "enterPin".tr(context),
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: AppColors.kPrimaryColor),
                ),
              ),
              SizedBox(height: 20.h),
              Pinput(
                animationCurve: Curves.slowMiddle,
                controller: _firstController,
              ),
              SizedBox(height: 20.h),
              Align(
                alignment: Alignment.center,
                child: Text(
                  "confirmPin".tr(context),
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: AppColors.kPrimaryColor),
                ),
              ),
              SizedBox(height: 20.h),
              Pinput(
                animationCurve: Curves.slowMiddle,
                controller: _secondController,
                onCompleted: (pin) {
                  if (pin != _firstController.text) {
                    DelightToastBar(
                      autoDismiss: true,
                      builder: (context) => CustomToastCard(
                        text: "pinDoNotMatch",
                        color: const Color.fromARGB(255, 202, 16, 3),
                      ),
                    ).show(context);
                    setState(() {
                      isMatch = false;
                    });
                  } else if (pin == _firstController.text) {
                    setState(() {
                      isMatch = true;
                    });
                  }
                },
              ),
              SizedBox(height: 50.h),
              if (isMatch)
                BlocBuilder<NewPinCubit, NewPinState>(
                  builder: (context, state) {
                    if (state is NewPinSuccess) {
                      DelightToastBar(
                        autoDismiss: true,
                        builder: (context) => CustomToastCard(
                          text: "pinResetSuccess",
                          color: Colors.green,
                        ),
                      ).show(context);
                    }

                    return CustomButton(
                      title: "confirmReset".tr(context),
                      ontap: () async {
                        BlocProvider.of<NewPinCubit>(context)
                            .resetPin(_secondController.text);
                        await Future.delayed(const Duration(seconds: 1));
                        // ignore: use_build_context_synchronously
                        (context).pop();
                      },
                    );
                  },
                )
            ],
          ),
        ),
      ),
    );
  }
}
