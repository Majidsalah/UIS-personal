import 'package:dartz/dartz.dart';
import 'package:uis_attendance/core/error/failure.dart';
import 'package:uis_attendance/features/auth/set_new_pin/data/model/new_pin_model.dart';

abstract class NewPinRepository {
  Future<Either<Failure, NewPinModel>> resetPin(String newPin);
}
