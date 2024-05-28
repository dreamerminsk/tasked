import 'dart:core';

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../debug/debug_controller.dart';
import '../tasklist/task/task_item.dart';

class HtmlController extends GetxController {
  final DebugController debug = Get.find(tag: 'debugger');

  static final defaultUrls = List.unmodifiable([
    'https://www.rottentomatoes.com/',
    'https://en.wikipedia.org/wiki/Main_Page',
    'https://dtf.ru/',
    'https://www.metacritic.com/',
'https://habr.com/ru/articles/top/daily/',
'https://tech.onliner.by/',
  ]);

  final resourceController = TextEditingController(text: '');

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

  void randomUrl() {
    resourceController.text = defaultUrls.sample(1).single;
  }
}
