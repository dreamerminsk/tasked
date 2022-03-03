class Anime {
  String? title;
  String? wikiTitle;
  int? mviMonth;

  Anime({this.title, this.wikiTitle, this.mviMonth});

  Anime.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    wikiTitle = json['wikiTitle'];
    mviMonth = json[mviMonth];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['wikiTitle'] = this.wikiTitle;
    data['mviMonth'] = this.mviMonth;
    return data;
  }
}
