import 'dart:core';
import 'dart:io';

import 'package:get/get.dart';
import 'package:nanoid2/nanoid2.dart';

import '../../debug/debug_controller.dart';

import 'models/id3_tags.dart';

class DexFileController extends GetxController {
  final id = nanoid();

  final started = DateTime.now();

  final DebugController debug = Get.find(tag: 'debugger');

  final dexfile = Rxn<File>();

  RandomAccessFile? _raf;

  final header = Rxn<DexHeader>();

  @override
  void onInit() {
    super.onInit();
    debug.logInit(this.runtimeType.toString(), id, started);
  }

  @override
  void onReady() async {
    super.onReady();
    mp3file.value = Get.arguments;
    _raf = await dexfile.value?.open();
    final headerBuf = List<int>.filled(10, 0);
    final headerBufLength = await _raf?.readInto(headerBuf) ?? 0;
    if (headerBufLength > 9) {
      String identifier = String.fromCharCodes(headerBuf.sublist(0, 3));
      if (identifier == 'ID3') {
        header.value = DexHeader.parse(headerBuf);
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
