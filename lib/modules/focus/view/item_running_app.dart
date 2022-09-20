import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:uptodo/models/running_app.dart';
import 'package:uptodo/shared/common/common.dart';

class ItemRunningApp extends StatelessWidget {
  final RunningApp runningApp;

  const ItemRunningApp({
    Key? key,
    required this.runningApp,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {},
      leading: SvgPicture.asset(
        runningApp.applicationLogo,
        width: 32.w,
      ),
      minLeadingWidth: 32.w,
      tileColor: AppColors.quartz,
      title: Text(
        runningApp.application,
        style: Theme.of(context).textTheme.titleMedium,
      ),
      subtitle: Text(
        'You spent ${runningApp.runningTime} on ${runningApp.application} today',
        style: Theme.of(context).textTheme.caption,
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          VerticalDivider(
            width: 2.w,
            thickness: 2.w,
            color: AppColors.spanishGrey,
          ),
          SizedBox(width: 16.w),
          SvgPicture.asset(
            'assets/icons/ic_info_circle.svg',
            width: 24.w,
          ),
        ],
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }
}
