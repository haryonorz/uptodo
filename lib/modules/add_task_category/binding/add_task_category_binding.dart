import 'package:get/get.dart';
import 'package:uptodo/modules/add_task_category/controller/add_task_category_controller.dart';

class AddTasCategoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddTaskCategoryController>(() => AddTaskCategoryController());
  }
}
