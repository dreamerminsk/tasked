import 'dart:core';

import 'package:get/get.dart';

import '../debug/debug_controller.dart';
import '../routes/app_pages.dart';
import 'task/task_item.dart';

class TasklistController extends GetxController {
  final DebugController debug = Get.find(tag: 'debugger');
  final tasks = <TaskItem>[
TaskItem(
      id: 0,
      title: 'snooker :: events',
      path: Routes.SNOOKEREVENTS,
    ),
TaskItem(
      id: 1,
      title: 'snooker :: players',
      path: Routes.SNOOKERPLAYERS,
    ),
TaskItem(
      id: 2,
      title: 'html :: viewer',
      path: Routes.HTML,
    ),
].obs;

  @override
  void onInit() {
    super.onInit();
    debug.newInit(this.runtimeType.toString());
    tasks.addAll(List<TaskItem>.generate(
        29,
        (int index) => TaskItem(
              id: index + 3,
              title: 'task ${index + 3}',
            )));
  }

  @override
  void onClose() {
    debug.newClose(this.runtimeType.toString());
    super.onClose();
  }
}
