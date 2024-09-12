import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:uis_attendance/core/api/service_locator_setup.dart';
import 'package:uis_attendance/features/auth/login/data/repo/login_employee_repo_impl.dart';

part 'login_employee_state.dart';

class LoginEmployeeCubit extends Cubit<LoginEmployeeState> {
  LoginEmployeeCubit() : super(LoginEmployeeInitial());

  var loginEmployeeRepository = getIt.get<LoginEmployeeRepositoryImpl>();
  TextEditingController pinNumber = TextEditingController();

  Future<void> loginEmployee() async {
    emit(LoginEmployeeLoading());
    var loginEmployee =
        await loginEmployeeRepository.loginEmployee(pinNumber.text);

    loginEmployee.fold(
      (failure) => emit(LoginEmployeeFailure()),
      (logedIn) => emit(LoginEmployeeSucess()),
    );
  }
}
