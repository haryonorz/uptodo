import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uptodo/shared/common/common.dart';

class AccountImageButtomSheet extends StatelessWidget {
  const AccountImageButtomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Center(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 24.w,
              vertical: 10.h,
            ),
            child: Text(
              'Change account Image',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 32.w,
          ),
          child: const Divider(
            thickness: 1,
            height: 1,
            color: AppColors.spanishGrey,
          ),
        ),
        SizedBox(height: 16.h),
        ListTile(
          onTap: () {},
          title: Text(
            'Tack picture',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          contentPadding: EdgeInsets.symmetric(horizontal: 34.w),
        ),
        ListTile(
          onTap: () {},
          title: Text(
            'Import from gallery',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          contentPadding: EdgeInsets.symmetric(horizontal: 34.w),
        ),
        ListTile(
          onTap: () {},
          title: Text(
            'Import from Google Drive',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          contentPadding: EdgeInsets.symmetric(horizontal: 34.w),
        )
      ],
    );
  }
}
