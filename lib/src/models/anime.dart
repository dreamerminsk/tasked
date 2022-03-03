class Anime {
  String? title;
  String? wikiTitle;
  int mviMonth = 0;

  Anime({this.title, this.wikiTitle, this.mviMonth = 0});

  Anime.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    wikiTitle = json['wikiTitle'];
    mviMonth = json['mviMonth'] ?? 0;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['wikiTitle'] = this.wikiTitle;
    data['mviMonth'] = this.mviMonth;
    return data;
  }
}
