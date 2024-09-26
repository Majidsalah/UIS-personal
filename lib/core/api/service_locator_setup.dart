import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:uis_attendance/core/api/dio_consumer.dart';
import 'package:uis_attendance/features/auth/login/data/repo/login_employee_repo_impl.dart';
import 'package:uis_attendance/features/auth/set_new_pin/data/repo/newPin_repository_impl.dart';
import 'package:uis_attendance/features/auth/user_data/data/models/user_details_model.dart';
import 'package:uis_attendance/features/auth/user_data/data/user_repo/user_repo_impl.dart';
import 'package:uis_attendance/features/history/data/repo/history_repo_imp.dart';
import 'package:uis_attendance/features/home/attendance_record/data/repos/attendance_repo_impl.dart';

final GetIt getIt = GetIt.instance;
void setup() {
  getIt.registerSingleton<DioConsumer>(DioConsumer(dio: Dio()));
  getIt.registerSingleton<UserRepositoryImpl>(
      UserRepositoryImpl(getIt.get<DioConsumer>()));
  getIt.registerSingleton<UserDetailsModel>(UserDetailsModel());
  getIt.registerSingleton<LoginEmployeeRepositoryImpl>(
      LoginEmployeeRepositoryImpl(getIt.get<DioConsumer>()));
  getIt.registerSingleton<AttendanceRepoImpl>(
      AttendanceRepoImpl(getIt.get<DioConsumer>()));
  getIt.registerSingleton<NewPinRepositoryImpl>(
      NewPinRepositoryImpl(getIt.get<DioConsumer>()));

  getIt.registerSingleton<HistoryRepoImp>(
      HistoryRepoImp(dio: getIt.get<DioConsumer>()));
}
