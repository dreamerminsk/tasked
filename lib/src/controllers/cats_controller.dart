import 'dart:async';
import 'dart:convert';
import 'dart:core';

import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../models/category.dart';

class CatsController extends GetxController {
  static final animeRef = 'https://raw.githubusercontent.com/dreamerminsk/kb-dart/master/data/2023.anime.json';
  final categories = <Category>[
    Category('en', '2023 films'),
    Category('en', '21st-century actresses'),
    Category('en', '21st-century actors'),
    Category('en', '2023 television series debuts'),
    Category('en', '2023 American television series debuts'),
    Category('en', '2023 television series endings'),
    Category('en', '2023 in animation'),
    Category('en', '2023 anime'),
    Category('en', '2023 anime television series debuts'),
    Category('en', '2023 books'),
    Category('en', '2023 novels'),
    Category('en', '2023 British novels'),
    Category('en', 'Musical groups established in 2023'),
    Category('en', 'Musical groups disestablished in 2023'),
    Category('en', '2023 albums'),
    Category('en', '2023 singles'),
    Category('en', '2023 songs'),
    Category('en', '2023 video games')
  ].obs;
  var year = 2023.obs;

  @override
  void onInit() {
    super.onInit();
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
