import 'package:get/get.dart';

import 'mp3_files_controller.dart';

class Mp3FilesBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<Mp3FilesController>(() => Mp3FilesController());
  }
}
