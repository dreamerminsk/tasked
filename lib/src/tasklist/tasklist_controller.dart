import 'dart:core';

import 'package:get/get.dart';

import '../debug/debug_controller.dart';
import '../routes/app_pages.dart';
import 'task/task_item.dart';

class TasklistController extends GetxController {
  final DebugController debug = Get.find(tag: 'debugger');
  final tasks = <TaskItem>[].obs;

  @override
  void onInit() {
    super.onInit();
    debug.newInit(this.runtimeType.toString());
    tasks.add(TaskItem(
      id: 0,
      title: 'snooker::events',
      path: Routes.SNOOKEREVENTS,
    ));
    tasks.add(TaskItem(
      id: 1,
      title: 'snooker::players',
      path: Routes.SNOOKERPLAYERS,
    ));
    tasks.addAll(List<TaskItem>.generate(
        30,
        (int index) => TaskItem(
              id: index + 2,
              title: 'task ${index + 2}',
            )));
  }

  @override
  void onClose() {
    debug.newClose(this.runtimeType.toString());
    super.onClose();
  }
}
