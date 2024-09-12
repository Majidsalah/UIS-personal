import 'package:go_router/go_router.dart';
import 'package:uis_attendance/features/auth/login/presentation/screens/pin_input_screen.dart';
import 'package:uis_attendance/features/auth/set_new_pin/presentaion/screens/set_new_pin.dart';
import 'package:uis_attendance/features/auth/user_data/presentation/screens/user_details_screen.dart';
import 'package:uis_attendance/features/history/history_screen%20.dart';
import 'package:uis_attendance/features/home/attendance_record/presentation/screens/attendance_record_screen.dart';
import 'package:uis_attendance/features/setting/setting_screen.dart';

abstract class AppRouter {
  static String kUserDetailsScreen = '/';
  static String kPinInputScreen = '/pinInput';
  static String kHomePage = '/homePage';
  static String kNewPin = '/newPin';
  static String kSetting = '/setting';
  static String kHistory = '/history';

  static final router = GoRouter(routes: <RouteBase>[
    GoRoute(
      path: kUserDetailsScreen,
      builder: (context, state) {
        return const UserDetailsScreen();
      },
    ),
    GoRoute(
      path: kPinInputScreen,
      builder: (context, state) {
        return const PinInputScreen();
      },
    ),
    GoRoute(
      path: kHomePage,
      builder: (context, state) {
        return const AttendanceRecordScreen();
      },
    ),
    GoRoute(
      path: kNewPin,
      builder: (context, state) {
        return const SetNewPinScreen();
      },
    ),
    GoRoute(
      path: kSetting,
      builder: (context, state) {
        return const SettingScreen();
      },
    ),
    GoRoute(
      path: kHistory,
      builder: (context, state) {
        return const HistoryScreen();
      },
    ),
  ]);
}
