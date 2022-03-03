import 'dart:convert';
import 'dart:core';

import 'package:dio/dio.dart';
import 'package:get/get.dart';

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

  void fetchAnime() async {
    final text = await getAnime();
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

  Future<String> getAnime() async {
    try {
      var response = await Dio().get(animeRef);
      return response.data.toString();
    } catch (e) {
      print(e);
    }
    return '';
  }
}
