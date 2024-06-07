import 'dart:core';
import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;
import 'package:get/get.dart';
import 'package:nanoid2/nanoid2.dart';

import 'models/controller_info.dart';
import 'models/controller_stats.dart';

class DebugController extends GetxService {
  final id = nanoid();

  final started = DateTime.now();

  final debugStarted = Rxn<DateTime>();

  final stats = RxMap<String, ControllerStats>();

  var requests = 0.obs;

  var received = 0.obs;

  double get rpm =>
      60 *
      requests.value /
      (DateTime.now()
          .difference(debugStarted.value ?? DateTime.now())
          .inSeconds);

  final lastResponse = {}.obs;

  final samples = [].obs;

  void newInit(String name, String id, DateTime started) {
    if (stats.containsKey(name)) {
      stats[name]!.add(ControllerInfo(
        id: id,
        started: started,
      ));
    } else {
      stats[name] = ControllerStats();
      stats[name]!.add(ControllerInfo(
        id: id,
        started: started,
      ));
    }
  }

  void newClose(String name, String id, DateTime finished) {
    if (stats.containsKey(name)) {
      stats[name]!.remove(ControllerInfo(
        id: id,
        started: started,
        finished: finished,
      ));
    } else {}
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
    super.onInit();
    newInit(this.runtimeType.toString(), id, started);
    debugStarted.value = DateTime.now();
    loadSamples().then((items) => samples.assignAll(items));
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    newClose(this.runtimeType.toString(), id, DateTime.now());
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
