import 'package:get/get.dart';

import 'politics_controller.dart';

class PoliticsBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PoliticsController>(
      () => PoliticsController(),
    );
  }
}