class Anime {
  String title;
  String wikiTitle;

  Anime({this.title, this.wikiTitle});

  Anime.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    wikiTitle = json['wikiTitle'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['wikiTitle'] = this.wikiTitle;
    return data;
  }
}
