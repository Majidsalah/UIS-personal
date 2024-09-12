import 'package:dartz/dartz.dart';
import 'package:uis_attendance/core/error/failure.dart';
import 'package:uis_attendance/features/auth/user_data/data/models/user_details_model.dart';

abstract class UserRepository {
  Future<Either<Failure, UserDetailsModel>> getUserDetailes(String idNumber);
}
