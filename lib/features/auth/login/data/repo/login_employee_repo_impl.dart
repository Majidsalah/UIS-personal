import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:uis_attendance/core/api/dio_consumer.dart';
import 'package:uis_attendance/core/api/end_points.dart';
import 'package:uis_attendance/core/cache_helper/shared_prefrences.dart';
import 'package:uis_attendance/core/error/failure.dart';
import 'package:uis_attendance/features/auth/login/data/model/login_employee.dart';
import 'package:uis_attendance/features/auth/login/data/repo/login_employee_repo.dart';

class LoginEmployeeRepositoryImpl extends LoginEmployeeRepository {
  final DioConsumer dio;

  LoginEmployeeRepositoryImpl(this.dio);

  @override
  Future<Either<Failure, LoginEmployeeModel>> loginEmployee(
      String pinNumber) async {
    String idNumber = await ShPref.getNationalId();
    try {
      final response = await dio.get(
        EndPoints.loginEmployee,
        queryParameters: {
          ApiKeys.pinNumber: pinNumber,
          ApiKeys.idNumber: idNumber,
        },
      );
      LoginEmployeeModel loginEmployee = LoginEmployeeModel.fromJson(response);
      ShPref.saveAccessToken(loginEmployee.token!);

      return right(loginEmployee);
    } catch (e) {
      if (e is DioException) {
        return left(Serverfailure.fromDioError(e));
      }
      log(e.toString());
      return left(Serverfailure(e.toString()));
    }
  }
}
