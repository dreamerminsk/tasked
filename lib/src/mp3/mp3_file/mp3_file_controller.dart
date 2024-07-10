import 'dart:core';
import 'dart:io';

import 'package:get/get.dart';
import 'package:nanoid2/nanoid2.dart';

import '../../debug/debug_controller.dart';
import '../../tasklist/task/task_item.dart';

import 'models/id3_tags.dart';

class Mp3FileController extends GetxController {
  final id = nanoid();

  final started = DateTime.now();

  final DebugController debug = Get.find(tag: 'debugger');

  final mp3file = Rxn<File>();

  RandomAccessFile _raf;

  @override
  void onInit() {
    super.onInit();
    debug.logInit(this.runtimeType.toString(), id, started);
  }

  @override
  void onReady() {
    super.onReady();
    mp3file.value = Get.arguments;
    _raf = await mp3File.value.open();
    final headerBuf = List<int>.filled(10, 0);
    headerBufLength = await _raf.readInto(headerBuf);
    if (headerBufLength > 9) {
      Id3v2TagHeader.parse(headerBuf);
    }
  }

  @override
  void onClose() {
    debug.logClose(this.runtimeType.toString(), id, DateTime.now());
    if (_raf != null) {_raf.close();}
    super.onClose();
  }
}
