import 'dart:core';

import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;
import 'package:async/async.dart';
import 'package:characters/characters.dart';

import '../debug_controller.dart';

class JsonController extends GetxController {
  final DebugController debug = Get.find(tag: 'debugger');
  final jsonRef = ''.obs;
  final content = ''.obs;
  final objects = 0.obs;
  final arrays = 0.obs;

  @override
  void onInit() {
    jsonRef.value = Get.arguments;
    load();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void load() async {
    final fs = await fetchString(jsonRef.value);
    switch (fs) {
      case ErrorResult e:
        content.value = '$e';
      case ValueResult v: {
        process(v.value);
        content.value = '${v.value.length}: ${v.value.substring(0, 512 > v.value.length ? v.value.length : 512)}';
      }
      default:
          content.value = 'very strange';
      }
  }

  void process(String value) {
    for (var char in value.characters) {
      if (char == '{') {
        objects.value++;
      }
      if (char == '[') {
        arrays.value++;
      }
    }
  }

  Future<Result<String>> fetchString(String link) async {
    try {
      debug.newReq();
      var bytes = 0;
      var ttl = 0;
      final dio.Response<String> response = await dio.Dio().get(link,
          onReceiveProgress: (received, total) {
            bytes = received;
            ttl = (total > 0) ? total : received;
          }
      );
      debug.newBytes(bytes);
      debug.newRes({'time': DateTime.now(), 'total': ttl});
      return Result.value(response.data.toString());
    } catch (e, s) {
      Get.snackbar('JsonController.fetchString', '$e', snackPosition: SnackPosition.BOTTOM);
      return Result.error(e, s);
    }
  }

}
