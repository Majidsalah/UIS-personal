import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';
import 'package:uis_attendance/app/app_localization.dart';
import 'package:uis_attendance/core/utils/app_colors.dart';
import 'package:uis_attendance/core/utils/app_images.dart';
import 'package:uis_attendance/core/widgets/custom_app_bar.dart';
import 'package:uis_attendance/features/home/attendance_record/presentation/manager/cubit/attendance_record_cubit.dart';
import 'package:uis_attendance/features/home/attendance_record/presentation/screens/widgets/welcome_widget.dart';
import 'package:uis_attendance/features/home/attendance_record/presentation/screens/widgets/custom_circular_progress.dart';
import 'package:uis_attendance/features/home/attendance_record/presentation/screens/widgets/custom_drawer.dart';

class AttendanceRecordScreen extends StatefulWidget {
  const AttendanceRecordScreen({super.key});

  @override
  State<AttendanceRecordScreen> createState() => _AttendanceRecordScreenState();
}

class _AttendanceRecordScreenState extends State<AttendanceRecordScreen> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  // ignore: unused_field
  Position? _currentPosition;
  @override
  void initState() {
    super.initState();
    _determinePosition();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      permissionWidget();
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AttendanceRecordCubit(),
      child: Scaffold(
        drawer: const CustomDrawer(),
        key: scaffoldKey,
        body: Column(
          children: [
            CustomAppBar(
                isManyIcons: true,
                onTap: () {
                  scaffoldKey.currentState!.openDrawer();
                }),
            SizedBox(height: 20.h),
            const WelcomeWidget(),
            SizedBox(height: 160.h),
            Text(
              "recordAttendance".tr(context),
              style: TextStyle(
                  fontWeight: FontWeight.bold, color: AppColors.kPrimaryColor),
            ),
            SizedBox(height: 20.h),
            const CustomCircularProgress(),
          ],
        ),
      ),
    );
  }

  Future<void> _determinePosition() async {
    try {
      LocationPermission permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
      } else if (permission == LocationPermission.deniedForever) {
      } else {
        Position position = await Geolocator.getCurrentPosition();
        setState(() {
          _currentPosition = position;
        });
      }
    } catch (e) {}
  }

  permissionWidget() {
    showDialog(
        context: context,
        builder: (context) {
          return Center(
            child: AlertDialog(
              title: Column(
                children: [
                  const Icon(Icons.location_on),
                  SizedBox(height: 10.h),
                  Text(
                    "useYourLocation".tr(context),
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              content: Column(
                children: [
                  Text(
                    "locationPermission1".tr(context),
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Text(
                    "locationPermission2".tr(context),
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 50.h),
                  SizedBox(height: 150.h, child: Image.asset(AppImages.map)),
                ],
              ),
              actions: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.kPrimaryColor,
                      ),
                      onPressed: () {
                        setState(() {
                          _currentPosition = null;
                        });
                      },
                      child: Text(
                        "deny".tr(context),
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.kPrimaryColor,
                      ),
                      onPressed: () {
                        _determinePosition();
                        Navigator.of(context).pop();
                      },
                      child: Text(
                        "accept".tr(context),
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        });
  }
}
