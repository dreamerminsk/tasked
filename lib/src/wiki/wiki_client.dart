import 'dart:core';

import 'package:dio/dio.dart';
import 'package:get/get.dart';

class WikiClient extends GetxService {

  late Dio dio;

  static final WikiClient _instance = WikiClient._internal();

  factory WikiClient() {
    return _instance;
  }

  WikiClient._internal() {
    BaseOptions options = BaseOptions(
        //baseUrl: AppConstants.SERVER_API_URL,
        connectTimeout: const Duration(seconds: 32),
        receiveTimeout: const Duration(seconds: 32),
        headers: {
          'User-Agent': '',
        },
        contentType: "application/json: charset=utf-8",
        responseType: ResponseType.json);
    dio = Dio(options);

    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        return handler.next(options);
      }, onResponse: (response, handler) {
        if (kDebugMode) {
          print("app response data ${response.data}");
        }
        return handler.next(response);
      }, onError: (DioException e, handler) {
        if (kDebugMode) {
          print("app error data $e");
        }
      }));
  }

  @override
  void onInit() {
    super.onInit();
  }

}
