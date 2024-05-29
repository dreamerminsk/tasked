import 'package:get/get.dart';

import 'season_controller.dart';

class SeasonBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SeasonController>(() => SeasonController());
  }
}
