class Wiki {
  String? title;
  String? image;
  int mviMonth = 0;

  Wiki({this.title, this.image, this.mviMonth = 0});

  Wiki.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    image = json['image'];
    mviMonth = json['mviMonth'] ?? 0;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['image'] = this.image;
    data['mviMonth'] = this.mviMonth;
    return data;
  }
}
