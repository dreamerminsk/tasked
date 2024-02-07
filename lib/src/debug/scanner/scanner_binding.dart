import 'package:get/get.dart';

import 'scanner_controller.dart';

class ScannerBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ScannerController>(
      () => ScannerController(),
    );
  }
}
