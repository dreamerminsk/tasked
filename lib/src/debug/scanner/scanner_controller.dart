import 'dart:core';

import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;
import 'package:async/async.dart';
import 'package:nanoid2/nanoid2.dart';

import '../debug_controller.dart';

class ScannerController extends GetxController {
  final id = nanoid();
  final started = DateTime.now();
  final DebugController debug = Get.find(tag: 'debugger');

  @override
  void onInit() {
    super.onInit();
    debug.newInit(this.runtimeType.toString(), id, started);
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    debug.newClose(this.runtimeType.toString(), id, DateTime.now());
    super.onClose();
  }

  Future<Result<String>> fetchString(String link) async {
    try {
      debug.newReq();
      var bytes = 0;
      var ttl = 0;
      final dio.Response<String> response =
          await dio.Dio().get(link, onReceiveProgress: (received, total) {
        bytes = received;
        ttl = (total > 0) ? total : received;
      });
      debug.newBytes(bytes);
      debug.newRes({'time': DateTime.now(), 'total': ttl});
      return Result.value(response.data.toString());
    } catch (e, s) {
      Get.snackbar('JsonController.fetchString', '$e',
          snackPosition: SnackPosition.BOTTOM);
      return Result.error(e, s);
    }
  }
}
