import 'dart:core';

import 'package:get/get.dart';
import 'package:nanoid2/nanoid2.dart';

import '../debug/debug_controller.dart';
import '../tasklist/task/task_item.dart';

class Mp3Controller extends GetxController {
  final id = nanoid();

  final started = DateTime.now();

  final DebugController debug = Get.find(tag: 'debugger');

  final task = Rxn<TaskItem>();

  final mp3file = Rxn<File>();

  @override
  void onInit() {
    super.onInit();
    debug.newInit(this.runtimeType.toString(), id, started);
  }

  @override
  void onReady() {
    super.onReady();
    task.value = Get.arguments;
  }

  @override
  void onClose() {
    debug.newClose(this.runtimeType.toString(), id, DateTime.now());
    super.onClose();
  }

  void pickFile() {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles();
    } catch (e) {
      // Handle the exception, e.g., show an error message
    }

    if (result != null) {
      mp3file.value = File(result.files.single.path!);
    } else {
      // User canceled the picker
    }
  }
}
