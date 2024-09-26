import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uis_attendance/features/history/presentation/manager/cubit/history_logs_cubit.dart';
import 'package:uis_attendance/features/history/presentation/manager/cubit/sort_list_cubit.dart';
import 'package:uis_attendance/features/history/presentation/widgets/list_item.dart';

class HistoryListview extends StatelessWidget {
  const HistoryListview({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HistoryLogsCubit, HistoryLogsState>(
      builder: (context, state) {
        if (state is HistoryLogsSuccess) {
          if (state.logsList.isEmpty) {
            return const Text('No Activity logs in this period');
          }

          return BlocBuilder<SortListCubit, SortListState>(
            builder: (context, sorted) {
              var sortedList = sorted is ListNotSorted
                  ? state.logsList
                  : state.logsList.reversed.toList();
              return Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  itemBuilder: (_, index) {
                    return ListItem(
                      record: sortedList[index].time!,
                    );
                  },
                  itemCount: sortedList.length,
                ),
              );
            },
          );
        } else if (state is HistoryLogsLoading) {
          return const CircularProgressIndicator();
        }else if (state is HistoryLogsFailed){
          return const Text('Please enter right date period !');
        }
        else {
          return const Text('No Activity logs');
        }
      },
    );
  }
}
