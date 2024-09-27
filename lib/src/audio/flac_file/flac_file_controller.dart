import 'dart:core';
import 'dart:io';

import 'package:get/get.dart';
import 'package:nanoid2/nanoid2.dart';

import '../../debug/debug_controller.dart';

class FlacFileController extends GetxController {
  final id = nanoid();

  final started = DateTime.now();

  final DebugController debug = Get.find(tag: 'debugger');

  final flacFile = Rxn<File>();

  RandomAccessFile? _raf;

  @override
  void onInit() {
    super.onInit();
    debug.logInit(this.runtimeType.toString(), id, started);
  }

  @override
  void onReady() async {
    super.onReady();
    mp3file.value = Get.arguments;
    _raf = await flacFile.value?.open();
  }

  @override
  void onClose() {
    debug.logClose(this.runtimeType.toString(), id, DateTime.now());
    if (_raf != null) {
      _raf?.close();
    }
    super.onClose();
  }
}
