import 'dart:core';
import 'dart:collection';

import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;
import 'package:async/async.dart';
import 'package:characters/characters.dart';
import 'package:nanoid2/nanoid2.dart';

import '../debug_controller.dart';

class JsonController extends GetxController {
  final id = nanoid();
  final started = DateTime.now();
  final DebugController debug = Get.find(tag: 'debugger');
  final jsonRef = ''.obs;
  final error = Rxn<Object>(null);
  final objects = 0.obs;
  final arrays = 0.obs;
  final levels = 1.obs;
  final lobjects = [].obs;
  final larrays = [].obs;
  final content = ''.obs;
  final level = -1.obs;

  final openNodes = Queue<JsonNode>();
  final nodes = SplayTreeMap<int, JsonNode>();

  @override
  void onInit() {
    super.onInit();
    debug.logInit(this.runtimeType.toString(), id, started);
    jsonRef.value = Get.arguments;
    load();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    debug.logClose(this.runtimeType.toString(), id, DateTime.now());
    super.onClose();
  }

  void load() async {
    final fs = await fetchString(jsonRef.value);
    switch (fs) {
      case ErrorResult e:
        error.value = e.error;
      case ValueResult v:
        {
          content.value = v.value;
          error.value = null;
          process(v.value);
        }
      default:
        content.value = 'very strange';
    }
  }

  void process(String value) async {
    var level = 1;
    for (var char in value.characters) {
      if (char == '{') {
        if (level > lobjects.length) {
          lobjects.add(1);
          larrays.add(0);
        } else {
          lobjects[level - 1]++;
        }
        objects.value++;
        level++;
        if (levels < level) {
          levels.value = level;
        }
      } else if (char == '}') {
        level--;
      } else if (char == '[') {
        if (level > larrays.length) {
          larrays.add(1);
          lobjects.add(0);
        } else {
          larrays[level - 1]++;
        }
        arrays.value++;
        level++;
        if (levels < level) {
          levels.value = level;
        }
      } else if (char == ']') {
        level--;
      }
    }
  }

  Future<Result<String>> fetchString(String link) async {
    try {
      debug.newReq();
      var bytes = 0;
      var ttl = 0;
      final dio.Response<String> response =
          await dio.Dio().get(link, onReceiveProgress: (received, total) {
        bytes = received;
        ttl = (total > 0) ? total : received;
      });
      debug.newBytes(bytes);
      debug.newRes({'time': DateTime.now(), 'total': ttl});
      return Result.value(response.data.toString());
    } catch (e, s) {
      return Result.error(e, s);
    }
  }
}


class JsonNode {
  final int level;
  final int offset;
  final int length;

  const JsonNode({
    required this.level,
    required this.offset,
    required this.length,
  });

  JsonNode copyWith({
    int? level,
    int? offset,
    int? length,
  }) {
    return JsonNode(
      level: level ?? this.level,
      offset: offset ?? this.offset,
      length: length ?? this.length,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is JsonNode &&
        other.level == level &&
        other.offset == offset &&
        other.length == length;
  }

  @override
  int get hashCode => level.hashCode ^ offset.hashCode ^ length.hashCode;
}

class ArrayNode extends JsonNode {
  const ArrayNode({
    required int level,
    required int offset,
    required int length,
  }) : super(level: level, offset: offset, length: length);

  ArrayNode copyWith({
    int? level,
    int? offset,
    int? length,
  }) {
    return ArrayNode(
      level: level ?? this.level,
      offset: offset ?? this.offset,
      length: length ?? this.length,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ArrayNode && super == other;
  }

  @override
  int get hashCode => super.hashCode;
}

class ObjectNode extends JsonNode {
  const ObjectNode({
    required int level,
    required int offset,
    required int length,
  }) : super(level: level, offset: offset, length: length);

  ObjectNode copyWith({
    int? level,
    int? offset,
    int? length,
  }) {
    return ObjectNode(
      level: level ?? this.level,
      offset: offset ?? this.offset,
      length: length ?? this.length,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ObjectNode && super == other;
  }

  @override
  int get hashCode => super.hashCode;
}
