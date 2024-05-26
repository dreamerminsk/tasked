import 'dart:core';

import 'package:get/get.dart';

import '../../debug/debug_controller.dart';
import '../../tasklist/task/task_item.dart';

class EventController extends GetxController {
  final DebugController debug = Get.find(tag: 'debugger');
  final task = Rxn<TaskItem>();
  var isRunning = false.obs;

  @override
  void onInit() {
    super.onInit();
    debug.newInit(this.runtimeType.toString());
    task.value = Get.arguments;
  }

  @override
  void onClose() {
    debug.newClose(this.runtimeType.toString());
    super.onClose();
  }

  void start() {
    isRunning.value = true;
  }

  void stop() {
    isRunning.value = false;
  }
}
