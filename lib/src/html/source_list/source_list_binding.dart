import 'package:get/get.dart';

import 'source_list_controller.dart';

class SourceListBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SourceListController>(() => SourceListController());
  }
}
