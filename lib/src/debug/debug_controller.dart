import 'dart:core';
import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;
import 'package:get/get.dart' hide InstanceInfo;
import 'package:nanoid2/nanoid2.dart';

import 'models/instances.dart';

class DebugController extends GetxService {
  final id = nanoid();

  final started = DateTime.now();

  final debugStarted = Rxn<DateTime>();

  final instanceStats = RxMap<String, InstanceStats>();

var needUpdate = true.obs;

RestartableTimer? _timer;

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

  @override
  void onInit() {
    super.onInit();
    newInit(this.runtimeType.toString(), id, started);
    debugStarted.value = DateTime.now();
ever(needUpdate, _needUpdateChange);
    loadSamples().then((items) => samples.assignAll(items));
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    newClose(this.runtimeType.toString(), id, DateTime.now());
if(_timer!=null){
timer.cancel();
timer.dispose();
}
    super.onClose();
  }

void _needUpdateChange(bool event) {
if(event){
} else{
if(_timer!=null){
_timer.reset();
} else {
_timer=RestartableTimer(Duration(seconds: 16),()=>needUpdate=true);
}
}
}

void newInit(String name, String id, DateTime started) {
    if (instanceStats.containsKey(name)) {
      instanceStats[name]!.add(InstanceInfo(
        id: id,
        started: started,
      ));
    } else {
      instanceStats[name] = InstanceStats();
      instanceStats[name]!.add(InstanceInfo(
        id: id,
        started: started,
      ));
    }
  }

  void newClose(String name, String id, DateTime finished) {
    if (instanceStats.containsKey(name)) {
      instanceStats[name]!.remove(InstanceInfo(
        id: id,
        started: started,
        finished: finished,
      ));
    }
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

  Future<List<String>> loadSamples() async {
    final asset = await loadAsset();
    final ls = LineSplitter();
    return ls.convert(asset).toList();
  }

  Future<String> loadAsset() async {
    return await rootBundle.loadString('data/github.json.samples');
  }
}
