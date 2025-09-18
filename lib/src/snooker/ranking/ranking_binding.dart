import 'package:get/get.dart';

import 'ranking_controller.dart';

class RankingBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RankingController>(() => RankingController());
  }
}
