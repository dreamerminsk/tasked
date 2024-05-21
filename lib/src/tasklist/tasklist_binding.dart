import 'package:get/get.dart';

import 'tasklist_controller.dart';

class TasklistBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TasklistController>(() => TasklistController());
  }
}
