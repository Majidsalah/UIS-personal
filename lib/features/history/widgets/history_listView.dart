import 'package:flutter/material.dart';
import 'package:uis_attendance/features/history/widgets/list_item.dart';

class HistoryListview extends StatelessWidget {
  const HistoryListview({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        itemBuilder: (_, index) {
          return const ListItem();
        },
        itemCount: 30,
      ),
    );
  }
}
