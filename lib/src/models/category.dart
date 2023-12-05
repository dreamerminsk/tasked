class Category {
  int pageid;
  String lang;
  String title;
  int pages;
  int files;
  int subcats;

  Category({
    this.pageid = 0,
    this.lang = 'en',
    this.title = 'Main Page',
    this.pages = 0,
    this.files = 0,
    this.subcats = 0});

  Category.fromJson(Map<String, dynamic> json) {
    pageid = json['pageid'] ?? 0;
    lang = json['lang'] ?? 'en';
    title = json['title'] ?? '';
    pages = json['categoryinfo']?['pages'] ?? 0;
    files = json['categoryinfo']?['files'] ?? 0;
    subcats = json['categoryinfo']?['subcats'] ?? 0;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['lang'] = this.lang;
    data['title'] = this.title;
    return data;
  }
}
