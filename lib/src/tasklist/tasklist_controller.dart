import 'dart:core';

import 'package:get/get.dart';
import 'package:nanoid2/nanoid2.dart';

import '../debug/debug_controller.dart';
import '../routes/app_pages.dart';
import 'task/task_item.dart';

class TasklistController extends GetxController {
  final id = nanoid();
  final started = DateTime.now();
  final DebugController debug = Get.find(tag: 'debugger');
  const maxTasks = 32;
  final tasks = <TaskItem>[
    TaskItem(
      id: 0,
      title: 'snooker :: seasons',
      path: Routes.SNOOKERSEASONS,
    ),
    TaskItem(
      id: 1,
      title: 'snooker :: events',
      path: Routes.SNOOKEREVENTS,
    ),
    TaskItem(
      id: 2,
      title: 'snooker :: players',
      path: Routes.SNOOKERPLAYERS,
    ),
    TaskItem(
      id: 3,
      title: 'html :: viewer',
      path: Routes.HTML,
    ),
    TaskItem(
      id: 4,
      title: 'mp3 :: viewer',
      path: Routes.MP3,
    ),
  ].obs;

  @override
  void onInit() {
    super.onInit();
    debug.newInit(this.runtimeType.toString(), id, started);
  }

  @override
  void onReady() {
    super.onReady();
    tasks.addAll(List<TaskItem>.generate(
        maxTasks - tasks.length,
        (int index) => TaskItem(
              id: index + tasks.length,
              title: 'task ${index + tasks.length}',
            )));
  }

  @override
  void onClose() {
    debug.newClose(this.runtimeType.toString(), id, DateTime.now());
    super.onClose();
  }
}
