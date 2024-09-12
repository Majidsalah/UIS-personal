part of 'login_employee_cubit.dart';

sealed class LoginEmployeeState extends Equatable {
  const LoginEmployeeState();

  @override
  List<Object> get props => [];
}

final class LoginEmployeeInitial extends LoginEmployeeState {}

final class LoginEmployeeLoading extends LoginEmployeeState {}

final class LoginEmployeeSucess extends LoginEmployeeState {}

final class LoginEmployeeFailure extends LoginEmployeeState {}
