class OriginalImage {
  static final String wikiLogo =
      'https://upload.wikimedia.org/wikipedia/en/thumb/8/80/Wikipedia-logo-v2.svg/1122px-Wikipedia-logo-v2.svg.png';

  final String source;
  final int width;
  final int height;

  const OriginalImage({
    this.source = '',
    this.width = -1,
    this.height = -1,
  });

  OriginalImage copyWith({
    String? source,
    int? width,
    int? height,
  }) {
    return OriginalImage(
      source: source ?? this.source,
      width: width ?? this.width,
      height: height ?? this.height,
    );
  }

  factory OriginalImage.fromJson(Map<String, dynamic> json) {
    return OriginalImage(
      source: json['source'] ?? '',
      width: json['width'] ?? -1,
      height: json['height'] ?? -1,
    );
  }

  (String, int, int) toTuple() => (source, width, height);

  @override
  bool operator ==(covariant OriginalImage other) {
    if (identical(this, other)) return true;
    return other.toTuple() == toTuple();
  }

  @override
  int get hashCode => toTuple().hashCode;
}
