import 'package:get/get.dart';

import 'audio_files_controller.dart';

class AudioFilesBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AudioFilesController>(() => AudioFilesController());
  }
}
