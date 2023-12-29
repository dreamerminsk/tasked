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
https://en.wikipedia.org/w/api.php?action=query&list=categorymembers&cmtitle=Category:Physics&cmprop=ids|title|sortkeyprefix|timestamp&%20formatversion=2&format=json&cmlimit=50
      final url = 'https://${link.lang}.wikipedia.org/w/api.php?action=query&prop=categoryinfo&titles=${link.title}&formatversion=2&format=json';
      final result = await fetchMap(url);
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

Future<Result<Map>> fetchMap(String link) async {
    try {
      final dio.Response<Map> response = await dio.Dio().get(link);
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
