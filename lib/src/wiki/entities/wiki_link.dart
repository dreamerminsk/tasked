class WikiLink {
  final String prefix;
  final String title;

  const WikiLink({this.prefix = 'en', this.title = 'Main Page'});

  WikiLink copyWith({
    String? prefix,
    String? title,
  }) {
    return WikiLink(
      prefix: prefix ?? this.prefix,
      title: title ?? this.title,
    );
  }

  factory WikiLink.fromJson(Map<String, dynamic> json) {
    return WikiLink(
      prefix: json['prefix'] ?? 'en',
      title: json['title'] ?? 'Main Page',
    );
  }

  (String, String) asTuple() => (prefix, title);

  @override
  bool operator ==(covariant CategoryInfo other) {
    if (identical(this, other)) return true;
    return other.asTuple() == asTuple();
  }

  @override
  int get hashCode => asTuple().hashCode;
}
