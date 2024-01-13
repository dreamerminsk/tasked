import 'dart:core';

import 'package:async/async.dart';
import 'package:dio/dio.dart' as dio;
import 'package:get/get.dart';

import '../debug/debug_controller.dart';
import '../wiki/entities/category_info.dart';
import '../wiki/entities/wiki_link.dart';

final links = <WikiLink>[
    WikiLink(
      prefix: 'en',
      title: 'Category:Dogs'),
    WikiLink(
      prefix: 'ru',
      title: 'Категория:Фильмы 2024 года'),
    WikiLink(
      prefix: 'en',
      title: 'Category:2024'),
    WikiLink(
      prefix: 'en',
      title: 'Category:Animals'),
    WikiLink(
      prefix: 'en',
      title: 'Category:Fish'),
    WikiLink(
      prefix: 'en',
      title: 'Category:Flowers'),
    WikiLink(
      prefix: 'en',
      title: 'Category:Birds'),
    WikiLink(
      prefix: 'en',
      title: 'Category:Vehicles'),
    WikiLink(
      prefix: 'en',
      title: 'Category:Cuisine'),
    WikiLink(
      prefix: 'en',
      title: 'Category:2024 films'),
    WikiLink(
      prefix: 'en',
      title: 'Category:21st-century actors'),
    WikiLink(
      prefix: 'en',
      title: 'Category:2024 in television'),
    WikiLink(
      prefix: 'en',
      title: 'Category:2024 anime'),
    WikiLink(
      prefix: 'en',
      title: 'Category:2024 books'),
    WikiLink(
      prefix: 'en',
      title: 'Category:2024 in music'),
    WikiLink(
      prefix: 'en',
      title: 'Category:2024 video games'),
    WikiLink(
      prefix: 'en',
      title: 'Category:2024 in basketball'),
    WikiLink(
      prefix: 'en',
      title: 'Category:2024 in ice hockey'),
    WikiLink(
      prefix: 'en',
      title: 'Category:2024 in snooker'),
    WikiLink(
      prefix: 'en',
      title: 'Category:2024 in biathlon'),
    WikiLink(
      prefix: 'en',
      title: 'Category:2024 in alpine skiing'),
    WikiLink(
      prefix: 'en',
      title: 'Category:2024 in figure skating'),
    WikiLink(
      prefix: 'en',
      title: 'Category:2024 in ice hockey'),
    WikiLink(
      prefix: 'en',
      title: 'Category:2024 in tennis'),
    WikiLink(
      prefix: 'en',
      title: 'Category:2024 crimes'),
    WikiLink(
      prefix: 'en',
      title: 'Category:21st-century rulers'),
    WikiLink(
      prefix: 'en',
      title: 'Category:Alpine skiers'),
    WikiLink(
      prefix: 'en',
      title: 'Category:Tennis players'),
    WikiLink(
      prefix: 'en',
      title: 'Category:Snooker players'),
    WikiLink(
      prefix: 'en',
      title: 'Category:Figure skaters'),
    WikiLink(
      prefix: 'en',
      title: 'Category:Ice hockey players'),
    WikiLink(
      prefix: 'en',
      title: 'Category:Cars introduced in 2024'),
    WikiLink(
      prefix: 'en',
      title: 'Category:Mobile phones introduced in 2024'),
    WikiLink(
      prefix: 'en',
      title: 'Category:2024 software'),
    WikiLink(
      prefix: 'en',
      title: 'Category:Buildings and structures completed in 2024'),
    WikiLink(
      prefix: 'en',
      title: 'Category:Buildings and structures demolished in 2024'),
    WikiLink(
      prefix: 'en',
      title: 'Category:Current events'),
    WikiLink(
      prefix: 'en',
      title: 'Category:2024 in science'),
    WikiLink(
      prefix: 'en',
      title: 'Category:2024 in politics'),
    WikiLink(
      prefix: 'en',
      title: 'Category:2024 in sports'),
    WikiLink(
      prefix: 'en',
      title: 'Category:2022 in aviation'),
    WikiLink(
      prefix: 'en',
      title: 'Category:2024 in technology'),
  ];

class WatchlistController extends GetxController {

  final DebugController debug = Get.find(tag: 'debugger');

  final categories = <Result<CategoryInfo>>[].obs;

  var year = 2024.obs;

  @override
  void onInit() {
    super.onInit();
    links.sort((a, b) => a.title.compareTo(b.title));
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
      Get.snackbar('WatchlistController.fetchCategoryInfo', '$e', snackPosition: SnackPosition.BOTTOM);
      return Result.error(e, s);
    }
  }

Future<Result<Map>> fetchMap(
  String link,
 {Map<String, String>? params}) async {
    try {
      debug.newReq();
      var bytes = 0;
      final dio.Response<Map> response = await dio.Dio().get(
          link, queryParameters: params,
          onReceiveProgress: (received, total) {
            bytes = received;
          }
      );
      debug.newBytes(bytes);
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
