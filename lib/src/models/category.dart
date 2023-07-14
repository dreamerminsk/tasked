class Category {
  String? lang
  String? title;

  Category({this.lang, this.title});

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
