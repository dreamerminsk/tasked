import 'package:get/get.dart';

import 'mp3_file_controller.dart';

class Mp3FileBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<Mp3FileController>(() => Mp3FileController());
  }
}
