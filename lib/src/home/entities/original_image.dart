class OriginalImage {
  final String source;
  final int width;
  final int height;

  const OriginalImage({
    this.source = 'Main Page',
    this.width = -1,
    this.height = -1,
  });

  OriginalImage copyWith({
    String? title,
    int? width,
    int? height,
  }) {
    return OriginalImage(
      title: source ?? this.source,
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

  (String, int, int) _equality() => (source, width, height);

  @override
  bool operator ==(covariant OriginalImage other) {
    if (identical(this, other)) return true;
    return other._equality() == _equality();
  }

  @override
  int get hashCode => _equality().hashCode;
}