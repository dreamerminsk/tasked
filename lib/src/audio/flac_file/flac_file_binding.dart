import 'package:get/get.dart';

import 'flac_file_controller.dart';

class FlacFileBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FlacFileController>(() => FlacFileController());
  }
}
