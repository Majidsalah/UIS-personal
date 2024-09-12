import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:uis_attendance/core/api/dio_consumer.dart';
import 'package:uis_attendance/core/api/end_points.dart';
import 'package:uis_attendance/core/cache_helper/shared_prefrences.dart';
import 'package:uis_attendance/core/error/failure.dart';
import 'package:uis_attendance/features/auth/user_data/data/models/user_details_model.dart';
import 'package:uis_attendance/features/auth/user_data/data/user_repo/user_repo.dart';

class UserRepositoryImpl extends UserRepository {
  final DioConsumer dio;

  UserRepositoryImpl(this.dio);

  @override
  Future<Either<Failure, UserDetailsModel>> getUserDetailes(
      String idNumber) async {
    try {
      final response = await dio.get(
        EndPoints.getUserDetails,
        queryParameters: {ApiKeys.idNumber: idNumber},
      );
      UserDetailsModel userdetails = UserDetailsModel.fromJson(response);
      await ShPref.saveUserName(userdetails.employeeName!);
      await ShPref.saveCompanyName(userdetails.companyName!);
      return right(userdetails);
    } catch (e) {
      if (e is DioException) {
        return left(Serverfailure.fromDioError(e));
      }
      print(e.toString());
      return left(Serverfailure(e.toString()));
    }
  }
}
