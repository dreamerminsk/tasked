import 'dart:core';

//import 'package:collection/collection.dart';
//import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nanoid2/nanoid2.dart';
//import 'package:flutter/services.dart' show rootBundle;

import '../../debug/debug_controller.dart';
import '../../tasklist/task/task_item.dart';

class DomController extends GetxController {
  final id = nanoid();
  final started = DateTime.now();
  final DebugController debug = Get.find(tag: 'debugger');

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
    super.onClose();
  }

  //Future<String> _loadAsset(String assetKey) async {
    //return await rootBundle.loadString(assetKey);
  //}
}
