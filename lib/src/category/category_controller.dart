import 'dart:core';

import 'package:get/get.dart';

class CategoryController extends GetxController {
  final category = Result<CategoryInfo>.value(CategoryInfo()).obs;

  @override
  void onInit() {
    super.onInit();
  }

  Future<Result<CategoryInfo>> fetchCategoryInfo(WikiLink link) async {
    try {
      final url = 'https://${link.lang}.wikipedia.org/w/api.php';
      final params = {
          'action': 'query',
          'list': 'categorymembers',
          'cmtitle': '${link.title}',
          'cmprop': 'ids|title|type|timestamp',
          'cmlimit': 50,
          'formatversion': 2,
          'format': 'json',
      };
      final result = await fetchMap(url, params);
      switch (result) {
      case ErrorResult e:
        return Result.error(e.error);
      case ValueResult v: {
        final query = v.value['query'] as Map;
        final pages = query['pages'] as List;
        final cats = pages.map((item) => CategoryInfo.fromJson(item)).toList();
        return Result.value(cats[0]);
        }
      default:
          return Result.error('very strange');
      }
    } catch(e, s) {
      Get.snackbar('fetchCategoryInfo', '$e', snackPosition: SnackPosition.BOTTOM);
      return Result.error(e, s);
    }
  }

Future<Result<Map>> fetchMap(String link, {Map<String, String>? params}) async {
    try {
      final dio.Response<Map> response = await dio.Dio().get(link, queryParameters: params);
      return Result.value(response.data ?? {});
    } catch (e, s) {
      Get.snackbar('fetchMap', '$e', snackPosition: SnackPosition.BOTTOM);
      return Result.error(e, s);
    }
  }

  Future<Result<String>> fetchString(String link) async {
    try {
      final dio.Response<String> response = await dio.Dio().get(link);
      return Result.value(response.data.toString());
    } catch (e, s) {
      Get.snackbar('fetchString', '$e', snackPosition: SnackPosition.BOTTOM);
      return Result.error(e, s);
    }
  }

}
