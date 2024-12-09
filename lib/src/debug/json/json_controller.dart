import 'dart:core';
import 'dart:collection';

import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;
import 'package:async/async.dart';
import 'package:characters/characters.dart';
import 'package:nanoid2/nanoid2.dart';

import '../debug_controller.dart';
import 'nodes.dart';

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

  Future<String> getShort(JsonNode node, {int maxLength = 32}) async {
    final effectiveLength = node.length < 128 ? node.length : 128;
    final endOffset =
        (node.offset + effectiveLength).clamp(0, content.value.length);

    final range = content.value.characters.getRange(node.offset, endOffset);
    var text = range.string;

    text = text.replaceAll(RegExp(r'\s+'), '');

    return text.substring(0, maxLength.clamp(0, text.length));
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
            await scan();
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


  void readValue() {
    final token = readToken();
    if (token == '{') {
      
    } else if (token == '[') {
      
    } else if (token == '"') {
      
    } else if (token = '-') {
      
    } else if (token = '0') {
      
    } else if (token = '1') {
      
    } else if (token = '2') {
      
    } else if (token = '3') {
      
    } else if (token = '4') {
      
    } else if (token = '5') {
      
    } else if (token = '6') {
      
    } else if (token = '7') {
      
    } else if (token = '8') {
      
    } else if (token = '9') {
      
    } else if (token = 't') {
      
    } else if (token = 'f') {
      
    } else if (token = 'n') {
      
    } else if (token = ' ') {
      
    } else if (token = '\t') {
      
    } else if (token = '\r') {
      
    } else if (token = '\n') {
      
    } else {
      
    } 
  }

  void readObject() {
    
  }

  void readArray() {
    
  }

  void readString() {
    
  }

  void readNumber() {
    
  }

  void readBoolean() {
    
  }

  void readNull() {
    
  }

  String readToken() {
    
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
