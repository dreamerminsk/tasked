import 'package:get/get.dart';

import 'dex_files_controller.dart';

class DexFilesBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DexFilesController>(() => DexFilesController());
  }
}
