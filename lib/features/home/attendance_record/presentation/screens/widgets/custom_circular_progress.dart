import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:uis_attendance/core/utils/app_colors.dart';
import 'package:uis_attendance/core/utils/app_images.dart';
import 'package:uis_attendance/features/home/attendance_record/presentation/manager/cubit/attendance_record_cubit.dart';

class CustomCircularProgress extends StatefulWidget {
  const CustomCircularProgress({super.key});

  @override
  State<CustomCircularProgress> createState() => _CustomCircularProgressState();
}

class _CustomCircularProgressState extends State<CustomCircularProgress> {
  double _progressValue = 0.0;
  Timer? _timer;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AttendanceRecordCubit, AttendanceRecordState>(
      listener: (context, state) {
        if (state is AttendanceRecordLoading) {
          setState(() {
            _progressValue = 0.0;
          });
        } else if (state is AttendanceRecordSucess) {
          _showAnimation('assets/images/Animation - 1725384520524.json');
        } else if (state is AttendanceRecordFailure) {
          _showAnimation('assets/images/failedAnimation.json');
        }
      },
      builder: (context, state) {
        return GestureDetector(
          onTapDown: (details) {
            _startProgress();
          },
          onTapUp: (details) {
            _cancelProgress();
          },
          onTapCancel: () {
            _stopProgress();
          },
          child: Center(
            child: CircularPercentIndicator(
              radius: 60,
              lineWidth: 10.0,
              percent: _progressValue,
              center: SizedBox(
                height: 40.h,
                child: Image.asset(AppImages.fingerImage),
              ),
              progressColor: AppColors.kPrimaryColor,
            ),
          ),
        );
      },
    );
  }

  void _startProgress() {
    setState(() {
      _progressValue = 0.0;
    });

    _timer?.cancel();
    _timer = Timer.periodic(const Duration(milliseconds: 30), (timer) {
      setState(() {
        _progressValue += 0.01;
        if (_progressValue >= 0.96) {
          _progressValue = 1.0;
          timer.cancel();
          BlocProvider.of<AttendanceRecordCubit>(context).recordTimeDate();
        }
      });
    });
  }

  void _cancelProgress() {
    _timer?.cancel();
    setState(() {
      _progressValue = 0.0;
    });
  }

  void _stopProgress() {
    _timer?.cancel();
    setState(() {
      _progressValue = 1.0;
    });
  }

  void _showAnimation(String assetPath) {
    showDialog(
      context: context,
      builder: (context) {
        Timer(const Duration(seconds: 2), () {
          GoRouter.of(context).pop();
        });

        return SizedBox(
          height: 70,
          child: Lottie.asset(assetPath),
        );
      },
    );
  }

  // @override
  // void dispose() {
  //   _timer?.cancel();
  //   super.dispose();
  // }
}
