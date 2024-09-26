import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:uis_attendance/core/api/dio_consumer.dart';
import 'package:uis_attendance/core/api/end_points.dart';
import 'package:uis_attendance/core/cache_helper/shared_prefrences.dart';
import 'package:uis_attendance/core/error/failure.dart';
import 'package:uis_attendance/features/history/data/models/history_model.dart';
import 'package:uis_attendance/features/history/data/repo/history_repository.dart';

class HistoryRepoImp extends HistoryRepository {
  final DioConsumer dio;

  HistoryRepoImp({required this.dio});
  @override
  Future<Either<Failure, List<HistoryModel>>> getAttendanceHistory(
      var startDate, var endDate) async {
    String token = await ShPref.getAccessToken();
    Map<String, dynamic> headers = {"Authorization": "Bearer $token"};

    try {
      final response = await dio.get(EndPoints.getAttendanceHistory,
          options: Options(headers: headers),
          queryParameters: {
            ApiKeys.startDate: startDate,
            ApiKeys.endDate: endDate
          });
      List<dynamic> records = response;
      List<HistoryModel> logsList = [];

      for (var record in records) {
        HistoryModel log = HistoryModel(
          logId: record["logId"],
          time: record["time"],
        );
        logsList.add(log);
      }
      return right(logsList);
    } catch (e) {
      if (e is DioException) {
        return left(Serverfailure.fromDioError(e));
      }
      print(e.toString());
      return left(Serverfailure(e.toString()));
    }
  }
}
