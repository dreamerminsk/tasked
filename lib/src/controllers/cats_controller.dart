import 'dart:core';
import 'dart:async';

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
  final categories = <CategoryInfo>[
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

  void refresh() {
    Timer.periodic(const Duration(seconds: 8), refreshWikiStats);
  }

  void refreshWikiStats(Timer timer) async {
    final zeroes = links.where((a) => a.pageid == 0).toList();
    if (zeroes.length > 0) {
      final ci = await fetchCategoryInfo(zeroes[0].lang, zeroes[0].title);
      categories.add(ci);
      categories.refresh();
    } else {
      timer.cancel();
    }
  }

  void refreshWikiLinks() async {
    final stream = Stream<int>.periodic(
      const Duration(seconds: 8),
      (count) => links[count]).take(links.length);
  }


  Future<CategoryInfo> fetchCategoryInfo(String lang, String title) async {
    try {
      final link = 'https://${lang}.wikipedia.org/w/api.php?action=query&prop=categoryinfo&titles=${title}';
      final text = await fetchString(link);
      final jsonList = jsonDecode(text);
      final query = jsonList['query'];
      final pages = query['pages'];
      final cats = pages.entries.map((item) => CategoryInfo.fromJson(item.value)).toList();
      return cats[0];
    } catch(e) {
      Get.snackbar('fetchCategoryInfo', '$e', snackPosition: SnackPosition.BOTTOM);
    }
  }

  Future<String> fetchString(String link) async {
    try {
      var response = await Dio().get(link);
      return response.data.toString();
    } catch (e) {
      Get.snackbar('fetchString', '$e', snackPosition: SnackPosition.BOTTOM);
    }
    return '';
  }

}
