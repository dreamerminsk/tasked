class Category {
  String? lang
  String? title;

  Wiki({this.lang, this.title});

  Wiki.fromJson(Map<String, dynamic> json) {
    lang = json['lang'] ?? 'en';
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['lang'] = this.lang;
    data['title'] = this.title;
    return data;
  }
}
