import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uptodo/models/group_list_menu.dart';
import 'package:uptodo/shared/common/common.dart';
import 'package:uptodo/shared/widgets/group_list_tile.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Center(
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/images/photo_profile.png'),
                radius: 43,
              ),
            ),
            SizedBox(height: 10.h),
            Center(
              child: Text(
                'Martha Hays',
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            SizedBox(height: 20.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 17.h),
                      decoration: BoxDecoration(
                        color: AppColors.jet,
                        borderRadius: BorderRadius.circular(4.0),
                      ),
                      child: Text(
                        '10 Task left',
                        style: Theme.of(context).textTheme.titleMedium,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  SizedBox(width: 20.h),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 17.h),
                      decoration: BoxDecoration(
                        color: AppColors.jet,
                        borderRadius: BorderRadius.circular(4.0),
                      ),
                      child: Text(
                        '5 Task Done',
                        style: Theme.of(context).textTheme.titleMedium,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 32.h),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: List.generate(
                profileMenu.length,
                (index) => Padding(
                  padding: EdgeInsets.only(
                    top: index == 0 ? 0 : 16.h,
                    bottom: index == profileMenu.length ? 16.h : 0,
                  ),
                  child: GroupListTile(
                    groupListMenu: profileMenu[index],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
