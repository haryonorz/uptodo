import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:uptodo/modules/calendar/controller/calendar_controller.dart';
import 'package:uptodo/shared/common/common.dart';
import 'package:uptodo/shared/widgets/item_task.dart';

class IndexPage extends StatefulWidget {
  const IndexPage({Key? key}) : super(key: key);

  @override
  State<IndexPage> createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  final _controller = Get.put(CalendarController());

  @override
  void initState() {
    _controller.getListTask();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Index'),
        centerTitle: true,
        elevation: 0,
        leading: Container(
          width: 42.w,
          height: 42.h,
          margin: EdgeInsets.only(left: 10.w),
          child: SvgPicture.asset(
            'assets/icons/ic_drawer.svg',
            width: 24.w,
            height: 24.h,
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 24.w),
            child: const CircleAvatar(
              backgroundImage: AssetImage('assets/images/photo_profile.png'),
              radius: 21,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Obx(
          () {
            if (_controller.listDataToday.isEmpty &&
                _controller.listDataCompelete.isEmpty) {
              return Column(
                children: [
                  SizedBox(height: 75.h),
                  Center(
                    child: SvgPicture.asset(
                      'assets/icons/empty_task.svg',
                      width: 227.w,
                      height: 227.h,
                    ),
                  ),
                  Center(
                    child: Text(
                      'What do you want to do today?',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Center(
                    child: Text(
                      'Tap + to add your tasks',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                ],
              );
            } else {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 16.h),
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Search for your task...',
                        hintStyle: const TextStyle(color: AppColors.silverFoil),
                        prefixIcon: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 12.w,
                            vertical: 12.h,
                          ),
                          child: SvgPicture.asset('assets/icons/ic_search.svg'),
                        ),
                      ),
                    ),
                    SizedBox(height: 20.h),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.quartz,
                        padding: EdgeInsets.only(left: 16.w, right: 8.w),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Text('Today'),
                          SizedBox(width: 10.w),
                          const Icon(Icons.keyboard_arrow_down)
                        ],
                      ),
                    ),
                    Column(
                      children: List.generate(
                        _controller.listDataToday.length,
                        (index) => Padding(
                          padding: EdgeInsets.only(
                            top: 16.h,
                            bottom:
                                index == _controller.listDataToday.length - 1
                                    ? 20.h
                                    : 0,
                          ),
                          child: ItemTask(
                            task: _controller.listDataToday[index],
                          ),
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.quartz,
                        padding: EdgeInsets.only(left: 16.w, right: 8.w),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Text('Completed'),
                          SizedBox(width: 10.w),
                          const Icon(Icons.keyboard_arrow_down)
                        ],
                      ),
                    ),
                    Column(
                      children: List.generate(
                        _controller.listDataCompelete.length,
                        (index) => Padding(
                          padding: EdgeInsets.only(
                            top: 16.h,
                            bottom:
                                index == _controller.listDataToday.length - 1
                                    ? 20.h
                                    : 0,
                          ),
                          child: ItemTask(
                            task: _controller.listDataCompelete[index],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
