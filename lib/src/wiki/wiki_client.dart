import 'dart:core';

import 'package:dio/dio.dart';
import 'package:get/get.dart';

class WikiClient extends GetxService {

  final Dio _dio = Dio();

  @override
  void onInit() {
    super.onInit();
  }

}
