import 'dart:core';

import 'package:async/async.dart';
import 'package:dio/dio.dart' as dio;
import 'package:get/get.dart';

import '../../debug/debug_controller.dart';
import '../../wiki/entities/category_info.dart';

class RandomController extends GetxController {

  final DebugController debug = Get.find(tag: 'debugger');

  final Rxn<Object> lastError = Rxn<Object>();

  final categories = <CategoryInfo>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchRandom('en', 8);
    fetchRandom('ru', 8);
    fetchRandom('be', 8);
    fetchRandom('uk', 8);
  }

  void fetchRandom(String prefix, int count) {
    fetchRandomCategoryInfo(prefix, count).then(
      (item) {
        switch (item) {
            case ErrorResult e:
              lastError.value = e.error;
            case ValueResult v: {
              categories.addAll(v.value);
              categories.shuffle();
            }
            default:
              lastError.value = 'very strange';
        }
      }
    );
  }

  Future<Result<List<CategoryInfo>>> 
    fetchRandomCategoryInfo(String prefix, int count) async {
    try {
      final url = 'https://$prefix.wikipedia.org/w/api.php';
      final params = {
          'action': 'query',
          'generator': 'random',
          'grnnamespace': '14',
          'grnlimit': count.toString(),
          'prop': 'categoryinfo',
          'formatversion': '2',
          'format': 'json',
      };
      final result = await fetchMap(url, params: params);
      switch (result) {
      case ErrorResult e:
        return Result.error(e.error);
      case ValueResult v: {
        final query = v.value['query'] as Map;
        final pages = query['pages'] as List;
        final cats = pages.map((item) => CategoryInfo.fromJson(item)).toList();
        return Result.value(cats.map((item) => item.copyWith(lang: prefix)).toList());
      }
      default:
          return Result.error('very strange');
      }
    } catch(e, s) {
      Get.snackbar('RandomController.fetchCategoryInfo', '$e', snackPosition: SnackPosition.BOTTOM);
      return Result.error(e, s);
    }
  }

Future<Result<Map>> fetchMap(
  String link,
 {Map<String, String>? params}) async {
    try {
      debug.newReq();
      var bytes = 0;
      var ttl = 0;
      final dio.Response<Map> response = await dio.Dio().get(
          link, queryParameters: params,
          onReceiveProgress: (received, total) {
            bytes = received;
            ttl = (total > 0) ? total : received;
          }
      );
      debug.newBytes(bytes);
      debug.newRes({'time': DateTime.now(), 'total': ttl});
      return Result.value(response.data ?? {});
    } catch (e, s) {
      Get.snackbar('WatchlistController.fetchMap', '$e', snackPosition: SnackPosition.BOTTOM);
      return Result.error(e, s);
    }
  }

  Future<Result<String>> fetchString(String link) async {
    try {
      debug.newReq();
      final dio.Response<String> response = await dio.Dio().get(link);
      return Result.value(response.data.toString());
    } catch (e, s) {
      Get.snackbar('WatchlistController.fetchString', '$e', snackPosition: SnackPosition.BOTTOM);
      return Result.error(e, s);
    }
  }

}