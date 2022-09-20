import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class NavbarItem extends StatelessWidget {
  final String iconPath;
  final String label;
  final VoidCallback? onTap;

  const NavbarItem({
    Key? key,
    required this.iconPath,
    required this.label,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      child: SizedBox(
        width: 50.w,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(iconPath),
            SizedBox(height: 4.h),
            Text(
              label,
              style: Theme.of(context).textTheme.caption,
            )
          ],
        ),
      ),
    );
  }
}
