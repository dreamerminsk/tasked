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
    _raf = await mp3file.value?.open();
    final headerBuf = List<int>.filled(10, 0);
    final headerBufLength = await _raf?.readInto(headerBuf) ?? 0;
    if (headerBufLength > 9) {
      String identifier = String.fromCharCodes(headerBuf.sublist(0, 3));
      if (identifier == 'ID3') {
        header.value = Id3v2TagHeader.parse(headerBuf);
      }
    }
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
