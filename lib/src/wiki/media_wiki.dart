import 'dart:core';

import 'package:dio/dio.dart';
import 'package:get/get.dart';

class MediaWiki extends GetxService {
  late Dio dio;

  static final MediaWiki _instance = MediaWiki._internal();

  factory MediaWiki() {
    return _instance;
  }

  MediaWiki._internal() {
    BaseOptions options = BaseOptions(
        //baseUrl: AppConstants.SERVER_API_URL,
        connectTimeout: const Duration(seconds: 32),
        receiveTimeout: const Duration(seconds: 32),
        headers: {
          'User-Agent':
              'KbDartBot 0/0/64 (https://github.com/dreamerminsk/kb-dart; tutmirage@gmail.com) Flutter 3/16/5',
        },
        contentType: "application/json: charset=utf-8",
        responseType: ResponseType.json);
    dio = Dio(options);

    dio.interceptors.add(InterceptorsWrapper(onRequest: (options, handler) {
      return handler.next(options);
    }, onResponse: (response, handler) {
      print("app response data ${response.data}");
      return handler.next(response);
    }, onError: (DioException e, handler) {
      print("app error data $e");
    }));
  }

  @override
  void onInit() {
    super.onInit();
  }
}
