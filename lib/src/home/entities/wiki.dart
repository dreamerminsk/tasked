class Wiki {
  String? title;
  String? image;
  DateTime? lastUpdate;
  int mviMonth = 0;

  Wiki({this.title, this.image, this.lastUpdate, this.mviMonth = 0});

  Wiki.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    image = json['image'];
    lastUpdate = json['lastUpdate'];
    mviMonth = json['mviMonth'] ?? 0;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['image'] = this.image;
    data['lastUpdate'] = this.lastUpdate;
    data['mviMonth'] = this.mviMonth;
    return data;
  }
}
