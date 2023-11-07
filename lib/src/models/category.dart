class Category {
  String? lang;
  String? title;
  int pages;
  int files;
  int subcats;

  Category({this.lang, this.title, this.pages = 0, this.files = 0, this.subcats = 0});

  Category.fromJson(Map<String, dynamic> json) {
    lang = json['lang'] ?? 'en';
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['lang'] = this.lang ?? 'en';
    data['title'] = this.title ?? 'Main Page';
    return data;
  }
}
