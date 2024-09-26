import 'package:dartz/dartz.dart';
import 'package:uis_attendance/core/error/failure.dart';
import 'package:uis_attendance/features/history/data/models/history_model.dart';

abstract class HistoryRepository {
  Future<Either<Failure, List<HistoryModel>>> getAttendanceHistory(
      String startDate, String endDate);
}
