import'original_image.dart';

class Summary {
  final int pageid;
  final String lang;
  final String title;
  final String description;
  final String extract;
  final OriginalImage originalImage;

  const Summary({
    this.pageid = 0,
    this.lang = 'en',
    this.title = 'Main Page',
    this.description = '',
    this.extract = '',
    this.originalImage = OriginalImage(),
  });

  Summary copyWith({
    int? pageid,
    String? lang,
    String? title,
    String? description,
    String? extract,
    OriginalImage? originalImage,
  }) {
    return Summary(
      pageid: pageid ?? this.pageid,
      lang: lang ?? this.lang,
      title: title ?? this.title,
      description: description ?? this.description,
      extract: extract ?? this.extract,
      originalImage: originalImage ?? this.originalImage,
    );
  }

  factory Summary.fromJson(Map<String, dynamic> json) {
    return Summary(
      pageid: json['pageid'] ?? 0,
      lang: json['lang'] ?? 'en',
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      extract: json['extract'] ?? '',
      originalImage: OriginalImage.fromJson(json['originalimage'] ?? ''),
    );
  }

  (int, String, String) _equality() => (pageid, lang, title);

  @override
  bool operator ==(covariant Summary other) {
    if (identical(this, other)) return true;
    return other._equality() == _equality();
  }

  @override
  int get hashCode => _equality().hashCode;
}