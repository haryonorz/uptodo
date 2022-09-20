import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uptodo/models/group_list_menu.dart';
import 'package:uptodo/shared/widgets/group_list_tile.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        centerTitle: true,
        elevation: 0,
      ),
      body: Column(
        children: List.generate(
          settingsMenu.length,
          (index) => Padding(
            padding: EdgeInsets.only(
              top: index == 0 ? 6.h : 16.h,
              bottom: index == settingsMenu.length ? 16.h : 0,
            ),
            child: GroupListTile(
              groupListMenu: settingsMenu[index],
            ),
          ),
        ),
      ),
    );
  }
}
