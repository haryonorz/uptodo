import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uptodo/shared/common/common.dart';

class AppThemes {
  static final darkTheme = ThemeData(
    colorScheme: const ColorScheme.dark(
      primary: AppColors.violetAreBlue,
      secondary: AppColors.vistaBlue,
      onSecondary: AppColors.white,
      onPrimary: AppColors.white,
      background: AppColors.chineseBlack,
    ),
    inputDecorationTheme: const InputDecorationTheme(
      isDense: true,
      filled: true,
      fillColor: AppColors.eerieBlack,
      hintStyle: TextStyle(color: AppColors.davysGrey),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          width: .8,
          color: AppColors.spanishGrey,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          width: .8,
          color: AppColors.spanishGrey,
        ),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        padding: EdgeInsets.symmetric(
          horizontal: 24.w,
          vertical: 14.h,
        ),
        disabledForegroundColor: AppColors.vistaBlue.withOpacity(0.38),
        disabledBackgroundColor: AppColors.vistaBlue.withOpacity(0.12),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        overlayColor:
            MaterialStateColor.resolveWith((states) => Colors.transparent),
      ),
    ),
  );
}
