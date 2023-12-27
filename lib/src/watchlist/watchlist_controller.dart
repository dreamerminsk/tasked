import 'dart:core';

import 'package:async/async.dart';
import 'package:dio/dio.dart' as dio;
import 'package:get/get.dart';

import '../wiki/entities/category_info.dart';
import '../wiki/entities/wiki_link.dart';

final links = <WikiLink>[
    WikiLink(lang: 'en', title: 'Category:2023 films'),
    WikiLink(lang: 'en', title: 'Category:21st-century actors'),
    WikiLink(lang: 'en', title: 'Category:2023 in television'),
    WikiLink(lang: 'en', title: 'Category:2023 anime'),
    WikiLink(lang: 'en', title: 'Category:2023 books'),
    WikiLink(lang: 'en', title: 'Category:2023 in music'),
    WikiLink(lang: 'en', title: 'Category:2023 video games'),
    WikiLink(lang: 'en', title: 'Category:2023 in basketball'),
    WikiLink(lang: 'en', title: 'Category:2023 in ice hockey'),
    WikiLink(lang: 'en', title: 'Category:2023 in snooker'),
    WikiLink(lang: 'en', title: 'Category:2023 in biathlon'),
    WikiLink(lang: 'en', title: 'Category:2023 in alpine skiing'),
    WikiLink(lang: 'en', title: 'Category:2023 in figure skating'),
    WikiLink(lang: 'en', title: 'Category:2023 in ice hockey'),
    WikiLink(lang: 'en', title: 'Category:2023 in tennis'),
    WikiLink(lang: 'en', title: 'Category:2023 crimes'),
    WikiLink(lang: 'en', title: 'Category:21st-century rulers'),
    WikiLink(lang: 'en', title: 'Category:Alpine skiers'),
    WikiLink(lang: 'en', title: 'Category:Tennis players'),
    WikiLink(lang: 'en', title: 'Category:Snooker players'),
    WikiLink(lang: 'en', title: 'Category:Figure skaters'),
    WikiLink(lang: 'en', title: 'Category:Ice hockey players'),
    WikiLink(lang: 'en', title: 'Category:Cars introduced in 2023'),
    WikiLink(lang: 'en', title: 'Category:Mobile phones introduced in 2023'),
    WikiLink(lang: 'en', title: 'Category:2023 software'),
    WikiLink(lang: 'en', title: 'Category:Buildings and structures completed in 2023'),
    WikiLink(lang: 'en', title: 'Category:Buildings and structures demolished in 2023'),
  ];

class WatchlistController extends GetxController {
  final categories = <Result<CategoryInfo>>[
  ].obs;
  var year = 2023.obs;

  @override
  void onInit() {
    super.onInit();
    refreshWikiLinks();
  }

  void after() {
  }
  
  void before() {
  }

  void refreshWikiLinks() async {
    final linkStream = Stream<WikiLink>.periodic(
      const Duration(seconds: 8),
      (count) => links[count]).take(links.length);
    final infoStream =
    linkStream.asyncMap<Result<CategoryInfo>>(
      (link) => fetchCategoryInfo(link));
    infoStream.forEach((info) => categories.add(info));
  }

  Future<Result<CategoryInfo>> fetchCategoryInfo(WikiLink link) async {
    try {
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
