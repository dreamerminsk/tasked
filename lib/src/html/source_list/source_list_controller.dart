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
  final String id = nanoid();
  final DateTime started = DateTime.now();
  final DebugController debug = Get.find(tag: 'debugger');

  final RxList<Source> defaultUrls = <Source>[
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
  final TextEditingController resourceController = TextEditingController();

  final Rxn<TaskItem> task = Rxn<TaskItem>();

  @override
  void onInit() {
    super.onInit();
    debug.logInit(runtimeType.toString(), id, started);
    task.value = Get.arguments;
  }

  @override
  void onClose() {
    debug.logClose(runtimeType.toString(), id, DateTime.now());
    resourceController.dispose();
    super.onClose();
  }

  // Selects a random URL from the list and sets it in the resourceController.
  void randomUrl() {
    resourceController.text = defaultUrls.sample(1).single.toString();
  }

  // Loads the content of the URL at the specified index.
  Future<void> load(int index) async {
    currentUrl.value = index;
    final source = defaultUrls[currentUrl.value];

    if (source is AssetSource) {
      try {
        currentDoc.value = await _loadAsset(source.toString());
        Get.snackbar(
          'Load Complete',
          'Loaded content from ${source.toString()} with ${currentDoc.value.length} characters',
          snackPosition: SnackPosition.BOTTOM,
        );
      } catch (e) {
        Get.snackbar(
          'Load Error',
          'Failed to load content from ${source.toString()}: $e',
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } else {
      // Handle web source loading if necessary
    }
  }

  // Helper method to load an asset's content as a string.
  Future<String> _loadAsset(String assetKey) async {
    return await rootBundle.loadString(assetKey);
  }
}