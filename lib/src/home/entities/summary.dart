class Summary {
  final int pageid;
  final String lang;
  final String title;

  const Summary({
    this.pageid = 0,
    this.lang = 'en',
    this.title = 'Main Page',
  });

  Summary copyWith({
    int? pageid,
    String? lang,
    String? title,
  }) {
    return Summary(
      pageid: pageid ?? this.pageid,
      lang: lang ?? this.lang,
      title: title ?? this.title,
    );
  }

  factory Summary.fromJson(Map<String, dynamic> json) {
    return Summary(
      pageid: json['pageid'] ?? 0,
      lang: json['lang'] ?? 'en',
      title: json['title'] ?? '',
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