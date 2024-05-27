import 'dart:core';

import 'package:get/get.dart';

import '../debug/debug_controller.dart';
import '../tasklist/task/task_item.dart';

class HtmlController extends GetxController {

  final DebugController debug = Get.find(tag: 'debugger');

final resourceController = TextEditingController('https://www.rottentomatoes.com/');

  final task = Rxn<TaskItem>();

  @override
  void onInit() {
    super.onInit();
    debug.newInit(this.runtimeType.toString());
    task.value = Get.arguments;
  }

  @override
  void onClose() {
    debug.newClose(this.runtimeType.toString());
resourceController.dispose();
    super.onClose();
  }
}
