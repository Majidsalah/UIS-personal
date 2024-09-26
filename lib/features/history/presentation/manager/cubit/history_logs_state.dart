part of 'history_logs_cubit.dart';

sealed class HistoryLogsState {
  const HistoryLogsState();
}

final class HistoryLogsInitial extends HistoryLogsState {}

final class HistoryLogsSuccess extends HistoryLogsState {
  final List<HistoryModel> logsList;
  HistoryLogsSuccess({required this.logsList});
}

final class HistoryLogsFailed extends HistoryLogsState {}

final class HistoryLogsLoading extends HistoryLogsState {}

