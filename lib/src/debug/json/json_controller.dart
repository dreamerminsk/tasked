import 'dart:core';
import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;
import 'package:get/get.dart';

class JsonController extends GetxController {
  
  final jsonRef = ''.obs;

  @override
  void onInit() {
    jsonRef.value = Get.arguments;
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

}
