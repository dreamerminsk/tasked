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

  final RxMap<int, JsonNode> nodes = RxMap<int, JsonNode>();

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
          try {
            scan();
          } catch (e) {
            error.value = e;
          }
        }
      default:
        {
          content.value = '{}';
          error.value = null;
        }
    }
  }

  void scan() async {
    final text = content.value;
    final openNodes = Queue<JsonNode>();
    final offsets = SplayTreeMap<int, JsonNode>();
    var level = 0;
    var pos = 0;

    for (var char in text.characters) {
      if (char == Tokens.openBrace) {
        openNodes.addLast(ObjectNode(level: level, offset: pos, length: 1));
        level++;
      } else if (char == Tokens.closeBrace) {
        if (openNodes.isEmpty || openNodes.last is! ObjectNode) {
          throw FormatException('Unmatched closing brace at position $pos');
        }
        var node = openNodes.removeLast();
        offsets[node.offset] = node.copyWith(length: pos - node.offset + 1);
        level--;
      } else if (char == Tokens.openBracket) {
        openNodes.addLast(ArrayNode(level: level, offset: pos, length: 1));
        level++;
      } else if (char == Tokens.closeBracket) {
        if (openNodes.isEmpty || openNodes.last is! ArrayNode) {
          throw FormatException('Unmatched closing bracket at position $pos');
        }
        var node = openNodes.removeLast();
        offsets[node.offset] = node.copyWith(length: pos - node.offset + 1);
        level--;
      }
      pos++;
    }

    if (openNodes.isNotEmpty) {
      throw FormatException('Unmatched opening nodes remaining.');
    }

    nodes.addEntries(offsets.entries);
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
  // Private constructor to prevent instantiation
  Tokens._();

  /// The character for opening a JSON object.
  static const String openBrace = '{';

  /// The character for closing a JSON object.
  static const String closeBrace = '}';

  /// The character for opening a JSON array.
  static const String openBracket = '[';

  /// The character for closing a JSON array.
  static const String closeBracket = ']';

  /// The character for a comma in JSON.
  static const String comma = ',';

  /// The character for a colon in JSON.
  static const String colon = ':';

  /// The character for a double quotation mark in JSON.
  static const String doubleQuote = '"';

  /// A whitespace character (space).
  static const String space = ' ';

  /// A tab character.
  static const String tab = '\t';

  /// A newline character.
  static const String newline = '\n';

  /// A carriage return character.
  static const String carriageReturn = '\r';
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
