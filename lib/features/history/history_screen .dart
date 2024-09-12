import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uis_attendance/features/history/widgets/history_appBar.dart';
import 'package:uis_attendance/features/history/widgets/history_listView.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const HistoryAppBar(),
          SizedBox(height: 30.h),
          const HistoryListview(),
        ],
      ),
    );
  }
}
