class CategoryInfo {
  final int pageid;
  final String lang;
  final String title;
  final int pages;
  final int files;
  final int subcats;

  const CategoryInfo(
      {this.pageid = 0,
      this.lang = 'en',
      this.title = 'Main Page',
      this.pages = 0,
      this.files = 0,
      this.subcats = 0});

  CategoryInfo copyWith({
    int? pageid,
    String? lang,
    String? title,
    int? pages,
    int? files,
    int? subcats,
  }) {
    return CategoryInfo(
      pageid: pageid ?? this.pageid,
      lang: lang ?? this.lang,
      title: title ?? this.title,
      pages: pages ?? this.pages,
      files: files ?? this.files,
      subcats: subcats ?? this.subcats,
    );
  }

  factory CategoryInfo.fromJson(Map<String, dynamic> json) {
    return CategoryInfo(
      pageid: json['pageid'] ?? 0,
      lang: json['lang'] ?? 'en',
      title: json['title'] ?? '',
      pages: json['categoryinfo']?['pages'] ?? 0,
      files: json['categoryinfo']?['files'] ?? 0,
      subcats: json['categoryinfo']?['subcats'] ?? 0,
    );
  }

  (int, String, String, int, int) toTuple() =>
      (pageid, lang, title, pages, subcats);

  @override
  bool operator ==(covariant CategoryInfo other) {
    if (identical(this, other)) return true;
    return other.toTuple() == toTuple();
  }

  @override
  int get hashCode => toTuple().hashCode;
}
