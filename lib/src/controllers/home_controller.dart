import 'dart:async';
import 'dart:convert';
import 'dart:core';

import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:html/parser.dart';

import '../models/anime.dart';

class HomeController extends GetxController {
  static final animeRef = 'https://raw.githubusercontent.com/dreamerminsk/kb-dart/master/data/wiki.anime.json';
  final animeList = <Anime>[].obs;
  var count = 0.obs;
  increment() => count++;

  @override
  void onInit() {
    fetchAnime();
    super.onInit();
  }

  void copyToClipboard() {
    final encoder = JsonEncoder.withIndent('   ');
    Clipboard.setData(ClipboardData(text: encoder.convert(animeList)));
  }

  void refresh() {
    Timer.periodic(const Duration(seconds: 16), refreshWikiStats);
  }

  void refreshWikiStats(Timer timer) async {
    final zeroes = animeList.where((a) => (a.wiki?.mviMonth ?? 0) == 0).
      where((a) => (a.wiki?.title?.length ?? 0) > 0).toList();
    if (zeroes.length > 0) {
      final piLink = 'https://en.wikipedia.org/w/index.php?title=${zeroes[0].wiki?.title}&action=info';
      final text = await fetchString(piLink);
      final document = parse(text);
      final rows = document.querySelectorAll('div.mw-pvi-month');
      if (rows.length > 0) {
        int val = int.tryParse(rows[0].text.replaceAll(RegExp(r','), '')) ?? 0;
        zeroes[0].wiki!.mviMonth = val;
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
    final text = await fetchString(animeRef);
    final jsonList = jsonDecode(text);
    Get.snackbar('jsonList', '${jsonList.length}', snackPosition: SnackPosition.BOTTOM);
    final al = jsonList.map((i) => Anime.fromJson(i)).toList();
    Get.snackbar('animeList', '${al.length}', snackPosition: SnackPosition.BOTTOM);
    Get.snackbar('anime', '${al[0]}', snackPosition: SnackPosition.BOTTOM);
    try {
      animeList.addAll(al);
      Get.snackbar('animeList.obs', '${animeList.length}', snackPosition: SnackPosition.BOTTOM);
      animeList.sort((a, b) => (b.wiki?.mviMonth ?? 0).compareTo(a.wiki?.mviMonth ?? 0));
      animeList.refresh();
    } catch(e) {
      Get.snackbar('catch', '${e}', snackPosition: SnackPosition.BOTTOM);
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
