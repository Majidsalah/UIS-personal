import 'package:bloc/bloc.dart';
import 'package:uis_attendance/core/api/service_locator_setup.dart';
import 'package:uis_attendance/features/history/data/models/history_model.dart';
import 'package:uis_attendance/features/history/data/repo/history_repo_imp.dart';

part 'history_logs_state.dart';

class HistoryLogsCubit extends Cubit<HistoryLogsState> {
  HistoryLogsCubit() : super(HistoryLogsInitial());

  var historyRepo = getIt.get<HistoryRepoImp>();

  Future<void> getLogsHistory(
    var startDate,
    var endDate,
  ) async {
    emit(HistoryLogsLoading());
    var records = await historyRepo.getAttendanceHistory(startDate, endDate);

    records.fold(
      (failure) => emit(HistoryLogsFailed()),
      (logList) => emit(HistoryLogsSuccess(logsList: logList)),
    );
  }


}
