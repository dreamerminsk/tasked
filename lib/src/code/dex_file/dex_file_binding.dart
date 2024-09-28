import 'package:get/get.dart';

import 'dex_file_controller.dart';

class DexFileBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DexFileController>(() => DexFileController());
  }
}
