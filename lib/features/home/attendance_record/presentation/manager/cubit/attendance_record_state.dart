part of 'attendance_record_cubit.dart';

sealed class AttendanceRecordState extends Equatable {
  const AttendanceRecordState();

  @override
  List<Object> get props => [];
}

final class AttendanceRecordInitial extends AttendanceRecordState {}

final class AttendanceRecordLoading extends AttendanceRecordState {}

final class AttendanceRecordSucess extends AttendanceRecordState {}

final class AttendanceRecordFailure extends AttendanceRecordState {}
