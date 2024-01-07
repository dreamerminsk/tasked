class CategoryMember {
  final int pageid;
  final String lang;
  final String title;
  final DateTime? timestamp;

  const CategoryMember({
    this.pageid = 0,
    this.lang = 'en',
    this.title = 'Main Page',
    this.timestamp,
  });

  CategoryMember copyWith({
    int? pageid,
    String? lang,
    String? title,
    DateTime? timestamp,
  }) {
    return CategoryMember(
      pageid: pageid ?? this.pageid,
      lang: lang ?? this.lang,
      title: title ?? this.title,
      timestamp: timestamp ?? this.timestamp,
    );
  }

  factory CategoryMember.fromJson(Map<String, dynamic> json) {
    return CategoryMember(
      pageid: json['pageid'] ?? 0,
      lang: json['lang'] ?? 'en',
      title: json['title'] ?? '',
      timestamp: DateTime.parse(json['timestamp']),
    );
  }

  (int, String, String) _equality() => (pageid, lang, title);

  @override
  bool operator ==(covariant CategoryMember other) {
    if (identical(this, other)) return true;
    return other._equality() == _equality();
  }

  @override
  int get hashCode => _equality().hashCode;
}
