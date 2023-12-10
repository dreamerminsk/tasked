class CategoryInfo {
  int pageid;
  String lang;
  String title;
  int pages;
  int files;
  int subcats;

  CategoryInfo({
    this.pageid = 0,
    this.lang = 'en',
    this.title = 'Main Page',
    this.pages = 0,
    this.files = 0,
    this.subcats = 0});

  CategoryInfo.fromJson(Map<String, dynamic> json) {
    pageid = json['pageid'] ?? 0;
    lang = json['lang'] ?? 'en';
    title = json['title'] ?? '';
    pages = json['categoryinfo']?['pages'] ?? 0;
    files = json['categoryinfo']?['files'] ?? 0;
    subcats = json['categoryinfo']?['subcats'] ?? 0;
  }
}
