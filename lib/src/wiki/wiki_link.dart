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
}
