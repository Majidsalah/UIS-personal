import 'package:flutter/material.dart';
import 'package:uis_attendance/app/uis_attendance.dart';
import 'package:uis_attendance/core/api/service_locator_setup.dart';
import 'package:uis_attendance/core/cache_helper/shared_prefrences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ShPref.init();
  setup();

  runApp(const UisAttendance());
}
