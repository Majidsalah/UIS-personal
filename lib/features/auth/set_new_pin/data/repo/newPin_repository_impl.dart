import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:uis_attendance/core/api/dio_consumer.dart';
import 'package:uis_attendance/core/api/end_points.dart';
import 'package:uis_attendance/core/cache_helper/shared_prefrences.dart';
import 'package:uis_attendance/core/error/failure.dart';
import 'package:uis_attendance/features/auth/set_new_pin/data/model/new_pin_model.dart';
import 'package:uis_attendance/features/auth/set_new_pin/data/repo/new_pin_repository.dart';

class NewPinRepositoryImpl extends NewPinRepository {
  final DioConsumer dio;

  NewPinRepositoryImpl(this.dio);
  @override
  Future<Either<Failure, NewPinModel>> resetPin(String newPin) async {
    String token = await ShPref.getAccessToken();
    log(token);
    String idNumber = await ShPref.getNationalId();
    log(idNumber);
    Map<String, dynamic> headers = {
      "Authorization": "Bearer $token",
    };
    try {
      final response = await dio.post(
        EndPoints.setNewPin,
        options: Options(headers: headers),
        queryParameters: {
          ApiKeys.idNumber: idNumber,
          ApiKeys.pinNumber: newPin,
        },
      );
      final bool isSuccessful = response as bool;
      NewPinModel checkBool = NewPinModel(value: isSuccessful);
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
