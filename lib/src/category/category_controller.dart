import 'dart:core';

import 'package:get/get.dart';

import '../wiki/responses/category_members_response.dart';

class CategoryController extends GetxController {
  final category = Rxn<CategoryInfo>().obs;

  final cmResponse = Rxn<CategoryMembersResponse>();

  final members = <CategoryMember>[].obs;

  @override
  void onInit() {
    super.onInit();
  }

  Future<Result<CateroryMembersResponse>> fetchCategoryMembers(WikiLink link) async {
    try {
      final url = 'https://${link.prefix}.wikipedia.org/w/api.php';
      final params = {
          'action': 'query',
          'list': 'categorymembers',
          'cmtitle': '${link.title}',
          'cmtype': 'subcat',
          'cmprop': 'ids|title|type|timestamp',
          'cmlimit': 'max',
          'formatversion': 2,
          'format': 'json',
      };
      final result = await fetchMap(url, params: params);
      switch (result) {
      case ErrorResult e:
        return Result.error(e.error);
      case ValueResult v: {
        final response = CategoryMembersResponse.fromJson(v.value);
        return Result.value(response);
        }
      default:
          return Result.error('very strange');
      }
    } catch(e, s) {
      Get.snackbar('fetchCategoryMembers', '$e', snackPosition: SnackPosition.BOTTOM);
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
