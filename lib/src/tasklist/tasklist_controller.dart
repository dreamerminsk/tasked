import 'dart:core';

import 'package:get/get.dart';

import '../debug/debug_controller.dart';

class WatchlistController extends GetxController {
  final DebugController debug = Get.find(tag: 'debugger');

  @override
  void onInit() {
    super.onInit();
    debug.newInit(this.runtimeType.toString());
  }

  @override
  void onClose() {
    debug.newClose(this.runtimeType.toString());
    super.onClose();
  }
}
