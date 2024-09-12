import 'package:dartz/dartz.dart';
import 'package:uis_attendance/core/error/failure.dart';
import 'package:uis_attendance/features/home/attendance_record/data/models/attendance_time_date_model.dart';

abstract class AttendanceRepository {
  Future<Either<Failure,AttendanceTimedateModel>> recordTime();
}
