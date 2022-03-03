import 'dart:async';
import 'dart:convert';
import 'dart:core';

import 'package:dio/dio.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  static final animeRef = 'https://raw.githubusercontent.com/dreamerminsk/kb-dart/first-version/data/wiki.anime.txt';
  final animeList = [].obs;
  var count = 0.obs;
  increment() => count++;

  @override
  void onInit() {
    fetchAnime();
    super.onInit();
  }

  void fetchAnime() async {
    var text = await getAnime();
    LineSplitter ls = new LineSplitter();
    List<String> lines = ls.convert(text);
    List<String> anime = lines[0::2];
    if (anime != null) {
      animeList.assignAll(anime);
    }
  }

  Future<String> getAnime() async {
    try {
      var response = await Dio().get(anime_ref);
      return response.data.ToString();
    } catch (e) {
      print(e);
    }
    return '';
  }
}
