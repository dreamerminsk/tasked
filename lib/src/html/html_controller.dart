import 'dart:core';

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../debug/debug_controller.dart';
import '../tasklist/task/task_item.dart';

class HtmlController extends GetxController {
  final DebugController debug = Get.find(tag: 'debugger');

  static const String defaultUrl = 'https://www.rottentomatoes.com/';

  final resourceController = TextEditingController(text: defaultUrl);

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
