import 'package:get/get.dart';
import 'package:nanoid2/nanoid2.dart';

import '../debug/debug_controller.dart';
import '../routes/app_pages.dart';
import 'task/task_item.dart';

class TasklistController extends GetxController {
  final id = nanoid();
  final started = DateTime.now();
  final DebugController debug = Get.find(tag: 'debugger');
  static const int maxTasks = 32;
  final RxList<TaskItem> tasks = <TaskItem>[
    TaskItem(id: 0, title: 'snooker :: seasons', path: Routes.SNOOKERSEASONS),
    TaskItem(id: 1, title: 'snooker :: events', path: Routes.SNOOKEREVENTS),
    TaskItem(id: 2, title: 'snooker :: players', path: Routes.SNOOKERPLAYERS),
    TaskItem(id: 3, title: 'html :: viewer', path: Routes.HTML_SOURCELIST),
    TaskItem(id: 4, title: 'mp3 :: viewer', path: Routes.MP3),
  ].obs;

  @override
  void onInit() {
    super.onInit();
    debug.logInit(runtimeType.toString(), id, started);
  }

  @override
  void onReady() {
    super.onReady();
    _populateTasks();
  }

  @override
  void onClose() {
    debug.logClose(runtimeType.toString(), id, DateTime.now());
    super.onClose();
  }

  void _populateTasks() {
    final int initialTaskCount = tasks.length;
    final int tasksToAdd = maxTasks - initialTaskCount;
    final List<TaskItem> newTasks = List.generate(
      tasksToAdd,
      (index) => TaskItem(
        id: index + initialTaskCount,
        title: 'task ${index + initialTaskCount}',
      ),
    );
    tasks.addAll(newTasks);
  }
}
