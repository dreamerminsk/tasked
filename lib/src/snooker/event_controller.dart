import 'dart:core';

import 'package:get/get.dart';

import '../debug/debug_controller.dart';
import '../routes/app_pages.dart';
import '../tasklist/task/task_item.dart';

class EventController extends GetxController {
  final DebugController debug = Get.find(tag: 'debugger');
  final task = <TaskItem>[].obs;

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
