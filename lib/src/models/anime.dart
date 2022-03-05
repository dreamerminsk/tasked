import 'wiki.dart';

class Anime {
  String? title;
  String? wikiTitle;
  String? wikiImage;
  int mviMonth = 0;

  Anime({this.title, this.wikiTitle, this.wikiImage, this.mviMonth = 0});

  Anime.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    wikiTitle = json['wikiTitle'];
    wikiImage = json['wikiImage'];
    mviMonth = json['mviMonth'] ?? 0;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['wikiTitle'] = this.wikiTitle;
    data['wikiImage'] = this.wikiImage;
    data['mviMonth'] = this.mviMonth;
    return data;
  }
}



class AnimeModel {
  String? title;
  Wiki? wiki;

  AnimeModel({this.title, this.wiki});

  AnimeModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    return data;
  }
}
