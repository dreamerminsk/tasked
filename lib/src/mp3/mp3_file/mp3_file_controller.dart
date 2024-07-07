import 'dart:core';
import 'dart:io';

import 'package:get/get.dart';
import 'package:nanoid2/nanoid2.dart';

import '../../debug/debug_controller.dart';
import '../../tasklist/task/task_item.dart';

class Mp3FileController extends GetxController {
  final id = nanoid();

  final started = DateTime.now();

  final DebugController debug = Get.find(tag: 'debugger');

  final task = Rxn<TaskItem>();

  final mp3file = Rxn<File>();

  @override
  void onInit() {
    super.onInit();
    debug.logInit(this.runtimeType.toString(), id, started);
  }

  @override
  void onReady() {
    super.onReady();
    task.value = Get.arguments;
  }

  @override
  void onClose() {
    debug.logClose(this.runtimeType.toString(), id, DateTime.now());
    super.onClose();
  }
}
