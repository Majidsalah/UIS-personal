import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:uis_attendance/core/api/service_locator_setup.dart';
import 'package:uis_attendance/features/auth/set_new_pin/data/repo/newPin_repository_impl.dart';

part 'new_pin_state.dart';

class NewPinCubit extends Cubit<NewPinState> {
  NewPinCubit() : super(NewPinInitial());

  var newPinRepo = getIt.get<NewPinRepositoryImpl>();

  Future<void> resetPin(String newPinNumber) async {
    emit(NewPinLoading());

    var resetPinRequest = await newPinRepo.resetPin(newPinNumber);

    resetPinRequest.fold(
      (failure) => emit(NewPinFailure()),
      (resetPinRequest) => emit(NewPinSuccess()),
    );
  }
}
