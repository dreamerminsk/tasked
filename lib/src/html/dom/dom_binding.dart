import 'package:get/get.dart';

import 'dom_controller.dart';

class DomBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DomController>(() => DomController());
  }
}
