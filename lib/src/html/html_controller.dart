import 'dart:core';

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nanoid2/nanoid2.dart';

import '../debug/debug_controller.dart';
import '../tasklist/task/task_item.dart';

class HtmlController extends GetxController {
  final id = nanoid();
  final started = DateTime.now();
  final DebugController debug = Get.find(tag: 'debugger');

  static final defaultUrls = List.unmodifiable([
    'https://www.rottentomatoes.com/',
    'https://en.wikipedia.org/',
    'https://dtf.ru/',
    'https://vc.ru/',
    'https://sports.ru/',
    'https://www.championat.com/',
    'https://www.metacritic.com/',
    'https://habr.com/',
    'https://tech.onliner.by/',
  ]);

  final resourceController = TextEditingController(text: '');

  final task = Rxn<TaskItem>();

  @override
  void onInit() {
    super.onInit();
    debug.logInit(this.runtimeType.toString(), id, started);
    task.value = Get.arguments;
  }

  @override
  void onClose() {
    debug.logClose(this.runtimeType.toString(), id, DateTime.now());
    resourceController.dispose();
    super.onClose();
  }

  void randomUrl() {
    resourceController.text = defaultUrls.sample(1).single;
  }
}
