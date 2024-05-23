import 'dart:core';

import 'package:get/get.dart';

import '../debug/debug_controller.dart';
import 'models/task.dart';

class TasklistController extends GetxController {
  final DebugController debug = Get.find(tag: 'debugger');
  final tasks = new List<Task>.generate(
      32,
      (int index) => Task(
            id: index,
            title: 'task $index',
          ));

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
