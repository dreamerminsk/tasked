import 'package:get/get.dart';

import 'debug_controller.dart';

class DebugBinding implements Bindings {
  @override
  void dependencies() {
    //if (!Get.isRegistered<DebugController>(tag: 'debugger')) {
      Get.put<DebugController>(
        DebugController(),
        tag: 'debugger',
      );
    //}
  }
}
