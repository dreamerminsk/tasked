import 'package:flutter/services.dart' show rootBundle;

import 'dart:core';

import 'package:get/get.dart';

class DebugController extends GetxService {
  
  final started = Rxn<DateTime>();

  var requests = 0.obs;

  double get rpm => requests / (DateTime.now().difference(started.value ?? DateTime.now()).inMinutes);

  //int get requests => _requests.value;

  final samples = [].obs;

  void newReq() {
    requests += 1;
  }

  @override
  void onInit() {
    started.value = DateTime.now();
    loadSamples().then(
      (items) => samples.assignAll(items);
    );
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<List<String>> loadSamples() async {
    final asset = await loadAsset();
    final ls = LineSplitter();
    return ls.convert(asset).toList();
  }

  Future<String> loadAsset() async {
    return await rootBundle.loadString('data/github.json.samples');
  }

}
