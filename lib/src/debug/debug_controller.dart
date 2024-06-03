import 'dart:core';
import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;
import 'package:get/get.dart';

import 'models/controller_stats.dart';

class DebugController extends GetxService {
  final started = Rxn<DateTime>();

  final stats = RxMap<String, ControllerStats>();

  var requests = 0.obs;

  var received = 0.obs;

  double get rpm =>
      60 *
      requests.value /
      (DateTime.now().difference(started.value ?? DateTime.now()).inSeconds);

  final lastResponse = {}.obs;

  final samples = [].obs;

void newInit(String name, String id, DateTime started) {

}

  void newInit(String name) {
    stats.update(
        name,
        (value) => value.copyWith(
              total: value.total + 1,
              live: value.live + 1,
            ),
        ifAbsent: () => ControllerStats(
              total: 1,
              live: 1,
            ));
  }

  void newClose(String name) {
    stats.update(
        name,
        (value) => value.copyWith(
              live: value.live - 1,
            ),
        ifAbsent: () => ControllerStats());
  }

  void newReq() {
    requests += 1;
  }

  void newRes(Map res) {
    lastResponse.clear();
    lastResponse.addAll(res);
  }

  void newBytes(int bytes) {
    received.value += bytes;
  }

  @override
  void onInit() {
    newInit(this.runtimeType.toString());
    started.value = DateTime.now();
    loadSamples().then((items) => samples.assignAll(items));
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    newClose(this.runtimeType.toString());
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
