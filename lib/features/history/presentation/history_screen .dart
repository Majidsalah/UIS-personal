import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uis_attendance/features/history/presentation/manager/cubit/history_logs_cubit.dart';
import 'package:uis_attendance/features/history/presentation/manager/cubit/sort_list_cubit.dart';
import 'package:uis_attendance/features/history/presentation/widgets/history_appBar.dart';
import 'package:uis_attendance/features/history/presentation/widgets/history_listView.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HistoryLogsCubit(),
      child: BlocProvider(
        create: (context) => SortListCubit(),
        child: Scaffold(
          body: Column(
            children: [
              const HistoryAppBar(),
              SizedBox(height: 30.h),
              const HistoryListview(),
            ],
          ),
        ),
      ),
    );
  }
}
