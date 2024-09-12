import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:uis_attendance/core/api/service_locator_setup.dart';
import 'package:uis_attendance/features/home/attendance_record/data/repos/attendance_repo_impl.dart';

part 'attendance_record_state.dart';

class AttendanceRecordCubit extends Cubit<AttendanceRecordState> {
  AttendanceRecordCubit() : super(AttendanceRecordInitial());

  var attendanceRecord = getIt.get<AttendanceRepoImpl>();
  Future<void> recordTimeDate() async {
    emit(AttendanceRecordLoading());
    var response = await attendanceRecord.recordTime();

    response.fold(
      (failure) => emit(AttendanceRecordFailure()),
      (response) => emit(AttendanceRecordSucess()),
    );
  }
}
