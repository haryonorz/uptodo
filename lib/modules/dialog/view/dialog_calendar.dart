import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:uptodo/modules/dialog/controller/dialog_controller.dart';
import 'package:uptodo/modules/dialog/view/dialog_time.dart';
import 'package:uptodo/shared/common/common.dart';

class DialogCalendar extends StatelessWidget {
  final _controller = Get.put(DialogController());

  DialogCalendar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      insetPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: 300.w,
            height: 290.h,
            child: Obx(() {
              return TableCalendar(
                firstDay: DateTime.utc(2010, 10, 16),
                lastDay: DateTime.utc(2030, 3, 14),
                focusedDay: _controller.selectedDay.value,
                calendarFormat: CalendarFormat.month,
                onDaySelected: (selectedDay, focusedDay) {
                  _controller.selectedDay.value = selectedDay;
                },
                selectedDayPredicate: (day) {
                  return isSameDay(_controller.selectedDay.value, day);
                },
                rowHeight: 34.h,
                calendarBuilders: CalendarBuilders(
                  headerTitleBuilder: (context, day) {
                    return Column(
                      children: [
                        Center(
                          child: Column(
                            children: [
                              Text(
                                DateFormat('MMMM').format(day).toUpperCase(),
                                style: Theme.of(context).textTheme.bodyText2,
                              ),
                              SizedBox(height: 4.h),
                              Text(
                                DateFormat('y').format(day),
                                style: Theme.of(context)
                                    .textTheme
                                    .caption
                                    ?.copyWith(color: AppColors.spanishGrey),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 10.h),
                        const Divider(height: 1, thickness: 1),
                      ],
                    );
                  },
                  dowBuilder: (context, day) {
                    var dayText = DateFormat('EEE').format(day).toUpperCase();
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5.w),
                      child: Center(
                        child: Text(
                          dayText,
                          style: Theme.of(context).textTheme.overline?.copyWith(
                                color: dayText == 'SUN' || dayText == 'SAT'
                                    ? AppColors.tartOrange
                                    : AppColors.white87,
                                fontWeight: FontWeight.w700,
                              ),
                        ),
                      ),
                    );
                  },
                  defaultBuilder: (context, day, focusedDay) {
                    return Container(
                      width: 24.w,
                      height: 24.h,
                      decoration: BoxDecoration(
                        color: AppColors.charlestonGreen,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Center(
                        child: Text(
                          DateFormat('d').format(day),
                          style: Theme.of(context)
                              .textTheme
                              .caption
                              ?.copyWith(fontWeight: FontWeight.w700),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    );
                  },
                  selectedBuilder: (context, day, focusedDay) {
                    return Container(
                      width: 24.w,
                      height: 24.h,
                      decoration: BoxDecoration(
                        color: AppColors.violetAreBlue,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Center(
                        child: Text(
                          DateFormat('d').format(day),
                          style: Theme.of(context)
                              .textTheme
                              .caption
                              ?.copyWith(fontWeight: FontWeight.w700),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    );
                  },
                  outsideBuilder: (context, day, focusedDay) {
                    return SizedBox(
                      width: 24.w,
                      height: 24.h,
                      child: Center(
                        child: Text(
                          DateFormat('d').format(day),
                          style: Theme.of(context).textTheme.caption?.copyWith(
                                color: AppColors.silverFoil,
                                fontWeight: FontWeight.w700,
                              ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    );
                  },
                ),
                calendarStyle: CalendarStyle(
                  isTodayHighlighted: false,
                  weekendDecoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                headerStyle: const HeaderStyle(
                  formatButtonVisible: false,
                ),
              );
            }),
          ),
          SizedBox(height: 28.h),
          Row(
            children: [
              Expanded(
                child: TextButton(
                  child: const Text('Cancel'),
                  onPressed: () {
                    Get.back();
                  },
                ),
              ),
              Expanded(
                child: ElevatedButton(
                  child: const Text('Choose Time'),
                  onPressed: () {
                    Get.back();
                    Get.dialog(
                      const DialogTime(),
                    );
                  },
                ),
              ),
            ],
          ),
          SizedBox(height: 8.h),
        ],
      ),
      titlePadding: EdgeInsets.symmetric(
        horizontal: 24.w,
        vertical: 10.h,
      ),
      contentPadding: EdgeInsets.symmetric(horizontal: 8.w),
      backgroundColor: AppColors.jet,
    );
  }
}
