import 'package:get/get.dart';

import 'html_controller.dart';

class HtmlBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HtmlController>(() => HtmlController());
  }
}
