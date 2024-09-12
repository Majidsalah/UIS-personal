import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:uis_attendance/core/api/dio_consumer.dart';
import 'package:uis_attendance/core/api/end_points.dart';
import 'package:uis_attendance/core/cache_helper/shared_prefrences.dart';
import 'package:uis_attendance/core/error/failure.dart';
import 'package:uis_attendance/features/home/attendance_record/data/models/attendance_time_date_model.dart';
import 'package:uis_attendance/features/home/attendance_record/data/repos/attendance_repository.dart';

class AttendanceRepoImpl extends AttendanceRepository {
  AttendanceRepoImpl(this.dio);

  final DioConsumer dio;
  final String recordTimeNow = DateTime.now().toUtc().toIso8601String();
  @override
  Future<Either<Failure, AttendanceTimedateModel>> recordTime() async {
    String token = await ShPref.getAccessToken();
    Map<String, dynamic> headers = {
      "Authorization": "Bearer $token",
    };
    try {
      final response = await dio.post(
        EndPoints.attendanceRecord,
        options: Options(headers: headers),
        queryParameters: {ApiKeys.time: recordTimeNow},
      );
      final bool isSuccessful = response as bool;
      AttendanceTimedateModel checkBool =
          AttendanceTimedateModel(value: isSuccessful);
      log("${checkBool.value}");
      return right(checkBool);
    } catch (e) {
      if (e is DioException) {
        log(e.toString());
        return left(Serverfailure.fromDioError(e));
      }
      log(e.toString());
      return left(Serverfailure(e.toString()));
    }
  }
}
