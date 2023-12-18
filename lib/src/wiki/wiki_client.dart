import 'dart:core';

import 'package:dio/dio.dart';
import 'package:get/get.dart';

class WikiClient extends GetxService {

  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'https://reqres.in/api',
      connectTimeout: 5000,
      receiveTimeout: 3000,
    ),
  );

  @override
  void onInit() {
    super.onInit();
  }

}
