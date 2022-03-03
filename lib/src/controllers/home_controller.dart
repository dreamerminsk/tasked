import 'dart:async';
import 'dart:convert';
import 'dart:core';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:html/parser.dart';

import '../models/anime.dart';

class HomeController extends GetxController {
  static final animeRef = 'https://raw.githubusercontent.com/dreamerminsk/kb-dart/master/data/wiki.anime.txt';
  final animeList = <Anime>[].obs;
  var count = 0.obs;
  increment() => count++;

  @override
  void onInit() {
    fetchAnime();
    super.onInit();
  }

  void refresh() {
    Timer.periodic(const Duration(seconds: 16), refreshWikiStats);
  }

  void refreshWikiStats(Timer timer) async {
    final zeroes = animeList.where((i) => i.mviMonth == 0).
      where((i) => (i.wikiTitle?.length ?? 0) > 16).toList();
    if (zeroes.length > 0) {
      final piLink = 'https://en.wikipedia.org/w/index.php?title=${zeroes[0].wikiTitle}&action=info';
      final text = await fetchString(piLink);
      final document = parse(text);
      final rows = document.querySelectorAll('div.mw-pvi-month');
      if (rows.length > 0) {
        int val = int.tryParse(rows[0].text.replaceAll(RegExp(r','), '')) ?? 0;
        zeroes[0].mviMonth = val;
        animeList.refresh();
      }
    } else {
      timer.cancel();
    }
  }

  void fetchAnime() async {
    final text = await fetchString(animeRef);
    const splitter = LineSplitter();
    final List<String> lines = splitter.convert(text);
    animeList.assignAll(fromLines(lines));
  }

  List<Anime> fromLines(List<String> lines) {
    final anime = <Anime>[];
    for(var i = 0; i < lines.length; i++) {
      if (i.isOdd) {
        anime.add(Anime(title: lines[i - 1], 
                  wikiTitle: lines[i]));
      }
    }
    return anime;
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
