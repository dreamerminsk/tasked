import 'package:get/get.dart';

import 'debug_controller.dart';

class DebugBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DebugController>(
      () => DebugController(),
    );
  }
}