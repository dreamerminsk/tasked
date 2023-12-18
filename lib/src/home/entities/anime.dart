import 'wiki.dart';

class Anime {
  String? id;
  String? title;
  Wiki? wiki;

  Anime({this.id, this.title, this.wiki});

  Anime.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    wiki = Wiki.fromJson(json['wiki']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['wiki'] = this.wiki != null ? this.wiki!.toJson() : null;
    return data;
  }
}
