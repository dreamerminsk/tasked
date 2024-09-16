import 'package:get/get.dart';

import 'audii_files_controller.dart';

class AudiiFilesBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AudioFilesController>(() => AudioFilesController());
  }
}
