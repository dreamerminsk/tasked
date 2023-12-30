class CategoryMembers {
  final int pageid;
  final String lang;
  final String title;
  final DateTime timestamp;

  const CategoryMembers({
    this.pageid = 0,
    this.lang = 'en',
    this.title = 'Main Page',
    this.timestamp,
  });

  CategoryMembers copyWith({
    int? pageid,
    String? lang,
    String? title,
    DateTime? timestamp,
  }) {
    return CategoryMembers(
      pageid: pageid ?? this.pageid,
      lang: lang ?? this.lang,
      title: title ?? this.title,
      timestamp: timestamp ?? this.timestamp,
    );
  }

  factory CategoryMembers(Map<String, dynamic> json) {
    return CategoryMembers(
      pageid: json['pageid'] ?? 0,
      lang: json['lang'] ?? 'en',
      title: json['title'] ?? '',
      timestamp: json['timestamp'] ?? null,
    );
  }

  (int, String, String) _equality() => (pageid, lang, title);

  @override
  bool operator ==(covariant CategoryMembers other) {
    if (identical(this, other)) return true;
    return other._equality() == _equality();
  }

  @override
  int get hashCode => _equality().hashCode;
}
