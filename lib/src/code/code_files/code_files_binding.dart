import 'package:get/get.dart';

import 'code_files_controller.dart';

class CodeFilesBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CodeFilesController>(() => CodeFilesController());
  }
}
