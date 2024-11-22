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
  final source = ''.obs;
  final error = Rxn<Object>(null);
  final content = ''.obs;

  final openNodes = Queue<JsonNode>();
  final nodes = SplayTreeMap<int, JsonNode>();

  @override
  void onInit() {
    super.onInit();
    debug.logInit(this.runtimeType.toString(), id, started);
    source.value = Get.arguments;
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
    final fs = await fetchString(source.value);
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
        content.value = '{}';
        error.value = null;
    }
  }

  void scan() async {
    final text = content.value;
    var level = 0;
    var pos = 0;

    const openBrace = '{';
    const closeBrace = '}';
    const openBracket = '[';
    const closeBracket = ']';

    for (var char in text.characters) {
      if (char == openBrace) {
        openNodes.addLast(ObjectNode(level: level, offset: pos, length: 1));
        level++;
      } else if (char == closeBrace) {
        if (openNodes.isEmpty || openNodes.last is! ObjectNode) {
          throw FormatException('Unmatched closing brace at position $pos');
        }
        var node = openNodes.removeLast();
        nodes[node.offset] = node.copyWith(length: pos - node.offset + 1);
        level--;
      } else if (char == openBracket) {
        openNodes.addLast(ArrayNode(level: level, offset: pos, length: 1));
        level++;
      } else if (char == closeBracket) {
        if (openNodes.isEmpty || openNodes.last is! ArrayNode) {
          throw FormatException('Unmatched closing bracket at position $pos');
        }
        var node = openNodes.removeLast();
        nodes[node.offset] = node.copyWith(length: pos - node.offset + 1);
        level--;
      }
      pos++;
    }

    if (openNodes.isNotEmpty) {
      throw FormatException('Unmatched opening nodes remaining.');
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

abstract class Tokens {

Tokens._();

static const const openBrace = '{';
   static const closeBrace = '}';
  static  const openBracket = '[';
   static const closeBracket = ']';

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
