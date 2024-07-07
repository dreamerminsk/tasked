import 'dart:core';

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nanoid2/nanoid2.dart';
import 'package:flutter/services.dart' show rootBundle;

import '../../debug/debug_controller.dart';
import '../../tasklist/task/task_item.dart';
import 'sources.dart';

class SourceListController extends GetxController {
  final id = nanoid();
  final started = DateTime.now();
  final DebugController debug = Get.find(tag: 'debugger');

  final defaultUrls = [
    Source.web('https://rottentomatoes.com/'),
    Source.web('https://en.wikipedia.org/'),
    Source.web('https://dtf.ru/'),
    Source.web('https://vc.ru/'),
    Source.web('https://sports.ru/'),
    Source.web('https://championat.com/'),
    Source.web('https://metacritic.com/'),
    Source.web('https://habr.com/'),
    Source.web('https://tech.onliner.by/'),
    Source.asset('data/html/index.html'),
    Source.asset('data/html/kb.html'),
    Source.asset('data/html/html5example.html'),
  ].obs;

  var currentUrl = 0.obs;

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
    resourceController.text = defaultUrls.sample(1).single.toString();
  }

  Future<void> load(int index) async {
    currentUrl.value = index;
    if (defaultUrls[currentUrl.value] is AssetSource) {
      currentDoc.value = await _loadAsset(defaultUrls[currentUrl.value].toString());
      Get.snackbar('Load Complete',
          'Loaded content from ${defaultUrls[currentUrl.value]} with ${currentDoc.value.length} characters',
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  Future<String> _loadAsset(String assetKey) async {
    return await rootBundle.loadString(assetKey);
  }
}
