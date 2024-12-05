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

class StringNode extends JsonNode {
  const StringNode({
    required int level,
    required int offset,
    required int length,
  }) : super(level: level, offset: offset, length: length);

  StringNode copyWith({
    int? level,
    int? offset,
    int? length,
  }) {
    return StringNode(
      level: level ?? this.level,
      offset: offset ?? this.offset,
      length: length ?? this.length,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is StringNode && super == other;
  }

  @override
  int get hashCode => super.hashCode;
}
