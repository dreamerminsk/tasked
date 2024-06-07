import 'package:get/get.dart';

import 'mp3_controller.dart';

class Mp3Binding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<Mp3Controller>(() => Mp3Controller());
  }
}
