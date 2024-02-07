import 'package:get/get.dart';

import 'random_controller.dart';

class RandomBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RandomController>(() => RandomController());
  }
}
