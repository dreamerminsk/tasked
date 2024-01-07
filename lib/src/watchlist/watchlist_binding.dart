import 'package:get/get.dart';

import 'watchlist_controller.dart';
import '../debug/debug_controller.dart';

class WatchlistBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DebugController>(
      () => DebugController());
    Get.lazyPut<WatchlistController>(
      () => WatchlistController());
  }
}