import 'package:get/route_manager.dart';
import 'package:uptodo/models/task.dart';
import 'package:uptodo/modules/add_task_category/binding/add_task_category_binding.dart';
import 'package:uptodo/modules/add_task_category/view/add_task_category_page.dart';
import 'package:uptodo/modules/home/binding/home_binding.dart';
import 'package:uptodo/modules/home/view/home_page.dart';
import 'package:uptodo/modules/login/binding/login_binding.dart';
import 'package:uptodo/modules/login/view/login_page.dart';
import 'package:uptodo/modules/on_boarding/binding/on_boarding_binding.dart';
import 'package:uptodo/modules/on_boarding/view/on_boarding_page.dart';
import 'package:uptodo/modules/register/binding/register_binding.dart';
import 'package:uptodo/modules/register/view/register_page.dart';
import 'package:uptodo/modules/settings/setting_page.dart';
import 'package:uptodo/modules/task/view/task_page.dart';
import 'package:uptodo/modules/welcome/welcome_page.dart';

part 'app_routes.dart';

class AppPages {
  static const initial = AppRoutes.onBoarding;

  static final routes = [
    GetPage(
      name: AppRoutes.onBoarding,
      page: () => const OnBoardingPage(),
      binding: OnBoardingBinding(),
    ),
    GetPage(
      name: AppRoutes.welcome,
      page: () => const WelcomePage(),
    ),
    GetPage(
      name: AppRoutes.login,
      page: () => const LoginPage(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: AppRoutes.register,
      page: () => const RegisterPage(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: AppRoutes.home,
      page: () => const HomePage(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: AppRoutes.task,
      page: () => TaskPage(
        task: Get.arguments as Task,
      ),
    ),
    GetPage(
      name: AppRoutes.addTaskCategory,
      page: () => const AddTasCategoryPage(),
      binding: AddTasCategoryBinding(),
    ),
    GetPage(
      name: AppRoutes.settings,
      page: () => const SettingsPage(),
    ),
  ];
}
