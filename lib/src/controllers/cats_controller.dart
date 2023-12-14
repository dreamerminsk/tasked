import 'dart:core';
import 'dart:async';

import 'package:async/async.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../wiki/category_info.dart';
import '../wiki/wiki_link.dart';

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

class CatsController extends GetxController {
  final categories = <Result<CategoryInfo>>[
  ].obs;
  var year = 2023.obs;

  @override
  void onInit() {
    super.onInit();
  }

  void after() {
    var newCats = categories.map(
      (item) => 
      CategoryInfo(
        lang: item.lang, 
        title: item.title?.replaceFirst(year.value.toString(), (year.value + 1).toString()),
      )
    ).toList();
    categories.clear();
    categories.addAll(newCats);
    year++;
  }
  
  void before() {
    var newCats = categories.map(
      (item) => 
      CategoryInfo(
        lang: item.lang, 
        title: item.title?.replaceFirst(year.value.toString(), (year.value - 1).toString()),
      )
    ).toList();
    categories.clear();
    categories.addAll(newCats);
    year--;
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
      final url = 'https://${link.lang}.wikipedia.org/w/api.php?action=query&prop=categoryinfo&titles=${link.title}';
      final result = await fetchString(url);
      swith (result) {
      case ErrorResult e:
        return Result.error(e.error);
      case ValueResult v:
        final jsonList = jsonDecode(v.value);
        final query = jsonList['query'];
        final pages = query['pages'];
        final cats = pages.entries.map((item) => CategoryInfo.fromJson(item.value)).toList();
        return Result value(cats[0]);
      default:
          return Result.error('very strange');
      }
    } catch(e, s) {
      Get.snackbar('fetchCategoryInfo', '$e', snackPosition: SnackPosition.BOTTOM);
      return Result.error(e, s);
    }
  }

  Future<Result<String>> fetchString(String link) async {
    try {
      var response = await Dio().get(link);
      return Result.value(response.data.toString());
    } catch (e, s) {
      Get.snackbar('fetchString', '$e', snackPosition: SnackPosition.BOTTOM);
      return Result.error(e, s);
    }
  }

}
