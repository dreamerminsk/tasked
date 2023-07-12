import 'dart:async';
import 'dart:convert';
import 'dart:core';

import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:html/parser.dart';

import '../models/anime.dart';
import '../models/category.dart';

class HomeController extends GetxController {
  static final animeRef = 'https://raw.githubusercontent.com/dreamerminsk/kb-dart/master/data/2023.anime.json';
  final animeList = <Anime>[].obs;
  final categories = <Category>[
    'Category:2023 films',
    'Category:21st-century actresses',
    'Category:21st-century actors',
    'Category:2023 television series debuts',
    'Category:2023 American television series debuts',
    'Category:2023 television series endings',
    'Category:2023 in animation',
    'Category:2023 anime',
    'Category:2023 anime television series debuts',
    'Category:2023 books',
    'Category:2023 novels',
    'Category:2023 British novels',
    'Category:Musical groups established in 2023',
    'Category:Musical groups disestablished in 2023',
    'Category:2023 albums',
    'Category:2023 singles',
    'Category:2023 songs',
    'Category:2023 video games'
  ].obs;
  var year = 2023.obs;
  var selected = Anime().obs;

  @override
  void onInit() {
    fetchAnime();
    super.onInit();
  }

  void select(int idx) {
    selected.update((value) {
      value?.title = animeList[idx].title;
      value?.wiki = animeList[idx].wiki;
    });
  }

  void copyToClipboard() {
    final encoder = JsonEncoder.withIndent('   ');
    Clipboard.setData(ClipboardData(text: encoder.convert(animeList)));
  }

  void refresh() {
    Timer.periodic(const Duration(seconds: 16), refreshWikiStats);
  }

  void refreshWikiStats(Timer timer) async {
    final zeroes = animeList.where((a) => a.wiki?.lastUpdate == null).
      where((a) => (a.wiki?.title?.length ?? 0) > 0).toList();
    if (zeroes.length > 0) {
      final piLink = 'https://en.wikipedia.org/w/index.php?title=${zeroes[0].wiki?.title}&action=info';
      final text = await fetchString(piLink);
      final document = parse(text);
      final rows = document.querySelectorAll('div.mw-pvi-month');
      if (rows.length > 0) {
        int val = int.tryParse(rows[0].text.replaceAll(RegExp(r','), '')) ?? 0;
        zeroes[0].wiki!.mviMonth = val;
        zeroes[0].wiki!.lastUpdate = DateTime.now();
      }
      final imgs = document.querySelectorAll('tr#mw-pageimages-info-label > td > a > img');
      if (imgs.length > 0) {
        String? imgLink = 'https:' + (imgs[0].attributes['src'] ?? '');
        zeroes[0].wiki!.image = imgLink;
      }
      animeList.sort((a, b) => (b.wiki?.mviMonth ?? 0).compareTo(a.wiki?.mviMonth ?? 0));
      animeList.refresh();
    } else {
      timer.cancel();
    }
  }

  void fetchAnime() async {
    try {
      final text = await fetchString(animeRef);
      final jsonList = jsonDecode(text);
      final al = List<Anime>.from(jsonList.map((i) => Anime.fromJson(i)));
      animeList.assignAll(al);
    } catch(e) {
      Get.snackbar('fetchAnime', '$e', snackPosition: SnackPosition.BOTTOM);
    }
  }

  Future<String> fetchString(String link) async {
    try {
      var response = await Dio().get(link);
      return response.data.toString();
    } catch (e) {
      print(e);
    }
    return '';
  }

}
