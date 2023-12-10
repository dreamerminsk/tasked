class WikiLink {
  final String lang;
  final String title;

  const WikiLink({
    required this.lang = 'en',
    required this.title = 'Main Page'
  });

  WikiLink copyWith({
    String? lang,
    String? title,
  }) {
    return WikiLink(
      lang: lang ?? this.lang,
      title: title ?? this.title,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is WikiLink &&
      other.lang == lang &&
      other.title == title;
  }

  @override
  int get hashCode => lang.hashCode ^ title.hashCode;
}
