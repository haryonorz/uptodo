import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:uptodo/modules/calendar/controller/calendar_controller.dart';
import 'package:uptodo/shared/common/app_colors.dart';

class Calendar extends GetView<CalendarController> {
  const Calendar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return TableCalendar(
        eventLoader: (day) {
          return controller.getTask(day);
        },
        firstDay: DateTime.utc(2010, 10, 16),
        lastDay: DateTime.utc(2030, 3, 14),
        focusedDay: controller.selectedDay.value,
        calendarFormat: CalendarFormat.week,
        onDaySelected: (DateTime selectDay, DateTime focusDay) {
          controller.selectedDay.value = selectDay;
          controller.getTaskToday();
          controller.getTaskComplete();
        },
        selectedDayPredicate: (day) {
          return isSameDay(controller.selectedDay.value, day);
        },
        daysOfWeekHeight: 30.h,
        rowHeight: 30.h,
        calendarBuilders: CalendarBuilders(
          headerTitleBuilder: (context, day) {
            return Center(
              child: Column(
                children: [
                  Text(
                    DateFormat('MMMM').format(day).toUpperCase(),
                    style: Theme.of(context)
                        .textTheme
                        .bodyText2
                        ?.copyWith(color: AppColors.white87),
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
            );
          },
          dowBuilder: (context, day) {
            var dayText = DateFormat('EEE').format(day).toUpperCase();
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.w),
              child: Container(
                decoration: BoxDecoration(
                  color: DateFormat('yyyy-MM-dd').format(day) ==
                          DateFormat('yyyy-MM-dd')
                              .format(controller.selectedDay.value)
                      ? AppColors.violetAreBlue
                      : AppColors.charlestonGreen,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(4),
                    topRight: Radius.circular(4),
                  ),
                ),
                child: Center(
                  child: Text(
                    dayText,
                    style: Theme.of(context).textTheme.bodyText2?.copyWith(
                          color: dayText == 'SUN' || dayText == 'SAT'
                              ? AppColors.tartOrange
                              : AppColors.white87,
                          fontWeight: FontWeight.w700,
                        ),
                  ),
                ),
              ),
            );
          },
          defaultBuilder: (context, day, focusedDay) {
            return Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: EdgeInsets.only(left: 5.w, right: 5.w, bottom: 5.h),
                child: Container(
                  padding: EdgeInsets.only(top: 2.h),
                  width: double.infinity,
                  height: double.infinity,
                  decoration: const BoxDecoration(
                    color: AppColors.charlestonGreen,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(4),
                      bottomRight: Radius.circular(4),
                    ),
                  ),
                  child: Text(
                    DateFormat('d').format(day),
                    style: Theme.of(context).textTheme.bodyText2?.copyWith(
                          color: AppColors.white87,
                          fontWeight: FontWeight.w700,
                        ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            );
          },
          selectedBuilder: (context, day, focusedDay) {
            return Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: EdgeInsets.only(left: 5.w, right: 5.w, bottom: 5.h),
                child: Container(
                  padding: EdgeInsets.only(top: 2.h),
                  width: double.infinity,
                  height: double.infinity,
                  decoration: const BoxDecoration(
                    color: AppColors.violetAreBlue,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(4),
                      bottomRight: Radius.circular(4),
                    ),
                  ),
                  child: Text(
                    DateFormat('d').format(day),
                    style: Theme.of(context).textTheme.bodyText2?.copyWith(
                          color: AppColors.white87,
                          fontWeight: FontWeight.w700,
                        ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            );
          },
          outsideBuilder: (context, day, focusedDay) {
            return Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: EdgeInsets.only(left: 5.w, right: 5.w, bottom: 5.h),
                child: Container(
                  padding: EdgeInsets.only(top: 2.h),
                  width: double.infinity,
                  height: double.infinity,
                  decoration: const BoxDecoration(
                    color: AppColors.charlestonGreen,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(4),
                      bottomRight: Radius.circular(4),
                    ),
                  ),
                  child: Text(
                    DateFormat('d').format(day),
                    style: Theme.of(context).textTheme.bodyText2?.copyWith(
                          color: AppColors.white87,
                          fontWeight: FontWeight.w700,
                        ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            );
          },
          markerBuilder: (context, day, events) {
            if (events.isNotEmpty) {
              return Container(
                width: 4.w,
                margin: EdgeInsets.only(top: 10.h),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.violetAreBlue,
                ),
              );
            } else {
              return Container();
            }
          },
        ),
        calendarStyle: CalendarStyle(
          isTodayHighlighted: false,
          weekendDecoration: BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(4),
          ),
          markersMaxCount: 1,
        ),
        headerStyle: const HeaderStyle(
          formatButtonVisible: false,
        ),
      );
    });
  }
}
