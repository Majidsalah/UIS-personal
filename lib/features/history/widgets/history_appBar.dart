import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:uis_attendance/app/app_localization.dart';
import 'package:uis_attendance/core/utils/app_colors.dart';
import 'package:uis_attendance/core/utils/app_images.dart';

class HistoryAppBar extends StatefulWidget {
  const HistoryAppBar({
    super.key,
  });

  @override
  State<HistoryAppBar> createState() => _HistoryAppBarState();
}

class _HistoryAppBarState extends State<HistoryAppBar> {
  bool isFiltered = false;
  CalendarFormat _calenderFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _rangeStart;
  DateTime? _rangeEnd;
  DateTime? _selectedDay;
  @override
  void initState() {
    super.initState();
    _rangeStart = _focusedDay;
  }

  void _onDaySelected(DateTime selctedDay, DateTime focusedDay) {
    if (!isSameDay(selctedDay, focusedDay)) {
      setState(() {
        _selectedDay = selctedDay;
        _focusedDay = focusedDay;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: 30.w,
        right: 30.w,
        top: 50.h,
        bottom: 18.h,
      ),
      width: double.infinity,
      decoration: BoxDecoration(
          color: AppColors.kPrimaryColor,
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(36),
            bottomRight: Radius.circular(36),
          )),
      child: Row(
        children: [
          IconButton(
              onPressed: () {
                GoRouter.of(context).pop();
              },
              icon: const Icon(Icons.arrow_back, color: Colors.white)),
          const Spacer(),
          Text(
            'history'.tr(context),
            style: const TextStyle(
                color: Colors.white, fontSize: 22, fontWeight: FontWeight.w500),
          ),
          const Spacer(),
          Row(
            children: [
              IconButton(
                onPressed: () {
                  showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return StatefulBuilder(builder:
                            (BuildContext context, StateSetter setState) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                TableCalendar(
                                  focusedDay: _focusedDay,
                                  firstDay: DateTime.utc(2024, 1, 1),
                                  lastDay: DateTime.utc(2050),
                                  selectedDayPredicate: (day) =>
                                      isSameDay(_selectedDay, day),
                                  onDaySelected: _onDaySelected,
                                  calendarFormat: _calenderFormat,
                                  rangeStartDay: _rangeStart,
                                  rangeEndDay: _rangeEnd,
                                  onRangeSelected: (start, end, focusedDay) {
                                    setState(() {
                                      _rangeStart = start;
                                      _rangeEnd = end;
                                      _focusedDay = focusedDay;
                                    });
                                  },
                                  rangeSelectionMode:
                                      RangeSelectionMode.toggledOn,
                                  onFormatChanged: (format) {
                                    if (_calenderFormat != format) {
                                      setState(() {
                                        _calenderFormat = format;
                                      });
                                    }
                                  },
                                  onPageChanged: (focusedDay) {
                                    _focusedDay = focusedDay;
                                  },
                                ),
                                const SizedBox(height: 12),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor:
                                            AppColors.kPrimaryColor,
                                      ),
                                      onPressed: () {
                                        //do request
                                      },
                                      child: const Text(
                                        "OK",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                    ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor:
                                            AppColors.kPrimaryColor,
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          _rangeEnd = null;
                                          _rangeEnd = null;
                                        });
                                      },
                                      child: const Text(
                                        "Cancel",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          );
                        });
                      });
                },
                icon: const Icon(Icons.calendar_month, color: Colors.white),
              ),
              IconButton(
                  onPressed: () {
                    setState(() {
                      isFiltered =! isFiltered;
                      //do sorting here
                    });
                  },
                  icon: SizedBox(
                    height: 24.h,
                    child: isFiltered
                        ? Image.asset(color: Colors.white, AppImages.down)
                        : Image.asset(color: Colors.white, AppImages.up),
                  )),
            ],
          )
        ],
      ),
    );
  }
}
