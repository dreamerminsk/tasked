import 'dart:core';

import 'package:async/async.dart';
import 'package:dio/dio.dart' as dio;
import 'package:get/get.dart';
import 'package:nanoid2/nanoid2.dart';

import '../debug/debug_controller.dart';
import '../wiki/entities/category_info.dart';
import '../wiki/entities/category_member.dart';
import '../wiki/entities/wiki_link.dart';
import '../wiki/responses/category_members_response.dart';

class CategoryController extends GetxController {
  final id = nanoid();
  final started = DateTime.now();
  final DebugController debug = Get.find(tag: 'debugger');

  final category = Rxn<CategoryInfo>();

  final members = <CategoryMember>[].obs;

  @override
  void onInit() {
    super.onInit();
    debug.newInit(this.runtimeType.toString(), id, started);
    category.value = Get.arguments;
    final link =
        WikiLink(prefix: category.value!.lang, title: category.value!.title);
    fetchCategoryMembers(link).then((res) {
      _update(res);
      fetchCategoryInfo(link).then((res) => _updateInfo(res));
    });
  }

  @override
  void onClose() {
    debug.newClose(this.runtimeType.toString(), id, DateTime.now());
    super.onClose();
  }

  void _updateInfo(Result<CategoryInfo> result) {
    switch (result) {
      case ErrorResult e:
        print(e.error);
      case ValueResult v:
        _setInfo(v.value);
      default:
        print('very strange');
    }
  }

  void _setInfo(CategoryInfo info) {
    category.value =
        category.value!.copyWith(subcats: info.subcats, pages: info.pages);
    category.refresh();
  }

  void _update(Result<CategoryMembersResponse> result) {
    switch (result) {
      case ErrorResult e:
        print(e.error);
      case ValueResult v:
        _setMembers(v.value.query);
      default:
        print('very strange');
    }
  }

  void _setMembers(List<CategoryMember> query) {
    if (category.value!.subcats < query.length) {
      category.value = category.value!.copyWith(
        subcats: query.length,
      );
    }
    category.refresh();
    members.clear();
    members.addAll(query);
  }

  Future<Result<CategoryInfo>> fetchCategoryInfo(WikiLink link) async {
    try {
      final url = 'https://${link.prefix}.wikipedia.org/w/api.php';
      final params = {
        'action': 'query',
        'prop': 'categoryinfo',
        'titles': '${link.title}',
        'formatversion': '2',
        'format': 'json',
      };
      final result = await fetchMap(url, params: params);
      switch (result) {
        case ErrorResult e:
          return Result.error(e.error);
        case ValueResult v:
          {
            final query = v.value['query'] as Map;
            final pages = query['pages'] as List;
            final cats =
                pages.map((item) => CategoryInfo.fromJson(item)).toList();
            return Result.value(cats[0].copyWith(lang: link.prefix));
          }
        default:
          return Result.error('very strange');
      }
    } catch (e, s) {
      Get.snackbar('CategoryController.fetchCategoryInfo', '$e',
          snackPosition: SnackPosition.BOTTOM);
      return Result.error(e, s);
    }
  }

  Future<Result<CategoryMembersResponse>> fetchCategoryMembers(
      WikiLink link) async {
    try {
      final url = 'https://${link.prefix}.wikipedia.org/w/api.php';
      final params = {
        'action': 'query',
        'list': 'categorymembers',
        'cmtitle': '${link.title}',
        'cmtype': 'subcat',
        'cmprop': 'ids|title|type|timestamp',
        'cmlimit': 'max',
        'formatversion': '2',
        'format': 'json',
      };
      final result = await fetchMap(url, params: params);
      switch (result) {
        case ErrorResult e:
          return Result.error(e.error);
        case ValueResult v:
          {
            final response = CategoryMembersResponse.fromJson(v.value);
            return Result.value(response);
          }
        default:
          return Result.error('very strange');
      }
    } catch (e, s) {
      Get.snackbar('CategoryController.fetchCategoryMembers', '$e,\r\n$s',
          snackPosition: SnackPosition.BOTTOM);
      return Result.error(e, s);
    }
  }

  Future<Result<Map>> fetchMap(String link,
      {Map<String, String>? params}) async {
    try {
      debug.newReq();
      var bytes = 0;
      var ttl = 0;
      final dio.Response<Map> response = await dio.Dio().get(link,
          queryParameters: params, onReceiveProgress: (received, total) {
        bytes = received;
        ttl = (total > 0) ? total : received;
      });
      debug.newBytes(bytes);
      debug.newRes({'time': DateTime.now(), 'total': ttl});
      return Result.value(response.data ?? {});
    } catch (e, s) {
      Get.snackbar('CategoryController.fetchMap', '$e',
          snackPosition: SnackPosition.BOTTOM);
      return Result.error(e, s);
    }
  }

  Future<Result<String>> fetchString(String link) async {
    try {
      debug.newReq();
      final dio.Response<String> response = await dio.Dio().get(link);
      return Result.value(response.data.toString());
    } catch (e, s) {
      Get.snackbar('fetchString', '$e', snackPosition: SnackPosition.BOTTOM);
      return Result.error(e, s);
    }
  }
}
