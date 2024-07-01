import 'dart:core';

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nanoid2/nanoid2.dart';
import 'package:flutter/services.dart' show rootBundle;

import '../debug/debug_controller.dart';
import '../tasklist/task/task_item.dart';

class HtmlController extends GetxController {
  final id = nanoid();
  final started = DateTime.now();
  final DebugController debug = Get.find(tag: 'debugger');

  final defaultUrls = [
    'https://rottentomatoes.com/',
    'https://en.wikipedia.org/',
    'https://dtf.ru/',
    'https://vc.ru/',
    'https://sports.ru/',
    'https://championat.com/',
    'https://metacritic.com/',
    'https://habr.com/',
    'https://tech.onliner.by/',
    'data/html/index.html',
    'data/html/kb.html',
    'data/html/html5example.html',
  ].obs;

  var currentUrl = ''.obs;

  var currentDoc = ''.obs;

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

  Future<void> load(int index) async {
    currentUrl.value = defaultUrls[index];
    if (!currentUrl.startsWith('http')) {
      currentDoc.value = await _loadAsset(currentUrl.value);
    }
  }

  Future<String> _loadAsset(String assetKey) async {
    return await rootBundle.loadString(assetKey);
  }
}
