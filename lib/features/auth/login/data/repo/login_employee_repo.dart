import 'package:dartz/dartz.dart';
import 'package:uis_attendance/core/error/failure.dart';
import 'package:uis_attendance/features/auth/login/data/model/login_employee.dart';

abstract class LoginEmployeeRepository {
  Future<Either<Failure, LoginEmployeeModel>> loginEmployee(String pinNumber);
}
