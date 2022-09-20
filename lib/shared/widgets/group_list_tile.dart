import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:uptodo/models/group_list_menu.dart';
import 'package:uptodo/shared/common/common.dart';

class GroupListTile extends StatelessWidget {
  final GroupListMenu groupListMenu;

  const GroupListTile({
    Key? key,
    required this.groupListMenu,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Text(
            groupListMenu.groupName,
            style: Theme.of(context)
                .textTheme
                .bodyMedium
                ?.copyWith(color: AppColors.spanishGrey),
          ),
        ),
        SizedBox(height: 4.h),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: List.generate(
            groupListMenu.listMenu.length,
            (index) => ListTile(
              onTap: groupListMenu.listMenu[index].onTap,
              leading: SvgPicture.asset(
                width: 24.w,
                groupListMenu.listMenu[index].iconPath,
                color: groupListMenu.listMenu[index].menuColor ??
                    AppColors.white87,
              ),
              minLeadingWidth: 24.w,
              title: Text(
                groupListMenu.listMenu[index].title,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: groupListMenu.listMenu[index].menuColor ??
                          AppColors.white87,
                    ),
              ),
              trailing: groupListMenu.listMenu[index].showTrailing
                  ? SvgPicture.asset('assets/icons/ic_arrow_right.svg')
                  : null,
              contentPadding: EdgeInsets.symmetric(horizontal: 24.w),
            ),
          ),
        )
      ],
    );
  }
}
