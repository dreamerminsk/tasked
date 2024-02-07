import 'package:get/get.dart';

import 'category_controller.dart';

class CategoryBinding implements Bindings {
  @override
  void dependencies() {
    Get.create<CategoryController>(() => CategoryController());
  }
}
