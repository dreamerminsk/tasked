import 'dart:async';
import 'dart:convert';
import 'dart:core';

import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:html/parser.dart';

import '../models/category.dart';

class CatsController extends GetxController {
  static final animeRef = 'https://raw.githubusercontent.com/dreamerminsk/kb-dart/master/data/2023.anime.json';
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
