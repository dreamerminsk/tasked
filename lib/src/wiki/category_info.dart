class CategoryInfo {
  final int pageid;
  final String lang;
  final String title;
  final int pages;
  final int files;
  final int subcats;

  const CategoryInfo({
    @required this.pageid = 0,
    @required this.lang = 'en',
    @required this.title = 'Main Page',
    @required this.pages = 0,
    @required this.files = 0,
    @required this.subcats = 0
  });

  CategoryInfo copyWith({
    int? pageid,
    String? lang,
    String? title,
    int? pages,
    int? files,
    int? subcats,
  }) {
    return CategoryInfo(
      pageid: pageid ?? this pageid,
      lang: lang ?? this.lang,
      title: title ?? this.title,
      pages: pages ?? this.pages,
      files: files ?? this.files,
      subcats: subcats ?? this.subcats,
    );
  }

  CategoryInfo.fromJson(Map<String, dynamic> json) {
    pageid = json['pageid'] ?? 0;
    lang = json['lang'] ?? 'en';
    title = json['title'] ?? '';
    pages = json['categoryinfo']?['pages'] ?? 0;
    files = json['categoryinfo']?['files'] ?? 0;
    subcats = json['categoryinfo']?['subcats'] ?? 0;
  }
}

