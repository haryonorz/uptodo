import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/route_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uptodo/shared/common/common.dart';
import 'package:uptodo/theme/app_themes.dart';
import 'package:uptodo/routes/routes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized;

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: false,
      builder: (context, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'UpTodo',
          darkTheme: AppThemes.darkTheme.copyWith(
            textTheme:
                GoogleFonts.latoTextTheme(AppThemes.darkTheme.textTheme).apply(
              bodyColor: AppColors.white87,
              displayColor: AppColors.white87,
            ),
            scaffoldBackgroundColor: AppColors.chineseBlack,
          ),
          themeMode: ThemeMode.dark,
          initialRoute: AppPages.initial,
          getPages: AppPages.routes,
        );
      },
    );
  }
}
