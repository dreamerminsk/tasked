import 'package:get/get.dart';

import 'json_controller.dart';

class JsonBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<JsonController>(
      () => JsonController(),
    );
  }
}
