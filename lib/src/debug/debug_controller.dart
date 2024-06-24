import 'dart:convert';

import 'package:async/async.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:get/get.dart' hide InstanceInfo;
import 'package:nanoid2/nanoid2.dart';

import 'models/instances.dart';

class DebugController extends GetxService {
  final id = nanoid();
  final started = DateTime.now();
  final debugStarted = Rxn<DateTime>();
  final instanceStats = RxMap<String, InstanceStats>();
  final requests = 0.obs;
  final received = 0.obs;
  final lastResponse = <String, dynamic>{}.obs;
  final samples = <String>[].obs;

  var _updateTick = 0.obs;
  RestartableTimer? _timer;

  double get rpm =>
      60 *
      requests.value /
      (DateTime.now()
          .difference(debugStarted.value ?? DateTime.now())
          .inSeconds);

  @override
  void onInit() {
    super.onInit();
    logInit(runtimeType.toString(), id, started);
    debugStarted.value = DateTime.now();
    _loadSamples();
  }

  @override
  void onClose() {
    logClose(runtimeType.toString(), id, DateTime.now());
    _timer?.cancel();
    super.onClose();
  }

  RxInt get updateTick {
    _startTimerIfNeeded();
    return _updateTick;
  }

  void _startTimerIfNeeded() {
    if (_timer == null || !_timer!.isActive) {
      _startTimer();
    }
  }

  void _startTimer() {
    _timer =
        RestartableTimer(Duration(seconds: 16), () => _updateTick.value += 1);
  }

  void stop() {
    _timer?.cancel();
  }

  void logInit(String name, String id, DateTime started) {
    final name = runtimeType.toString();
    if (instanceStats.containsKey(name)) {
      instanceStats[name]!.add(InstanceInfo(id: id, started: started));
    } else {
      instanceStats[name] = InstanceStats()
        ..add(InstanceInfo(id: id, started: started));
    }
  }

  void logClose(String name, String id, DateTime finished) {
    final name = runtimeType.toString();
    instanceStats[name]?.remove(
        InstanceInfo(id: id, started: started, finished: DateTime.now()));
  }

  void newReq() => requests.value += 1;

  void newRes(Map<String, dynamic> res) {
    lastResponse.assignAll(res);
  }

  void newBytes(int bytes) {
    received.value += bytes;
  }

  Future<void> _loadSamples() async {
    final asset = await _loadAsset();
    samples.assignAll(LineSplitter().convert(asset));
  }

  Future<String> _loadAsset() async {
    return await rootBundle.loadString('data/github.json.samples');
  }
}
