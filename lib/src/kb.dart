import 'dart:async';

import 'package:dio/dio.dart';
import 'package:html/dom.dart' as dom;
import 'package:html/parser.dart';

class YearRecord {
  int pos;
  String title;
  int boxOffice;

  YearRecord(this.pos, this.title, this.boxOffice);
}

class KbApi {
  static final yearBoxOffice =
      'http://kinobusiness.com/kassovye_sbory/films_year/';
  static Dio dio = Dio();

  Future<List<YearRecord>> getYearBoxOffice() async {
    try {
      var response =
          await dio.get('http://kinobusiness.com/kassovye_sbory/films_year/');
      var document = parse(response.data.toString());
      List<dom.Element> rows =
          document.querySelectorAll('table#krestable > tbody  > tr');
      return rows.map(toRec).toList();
    } catch (exception) {}
  }

  YearRecord toRec(dom.Element e) {
    var children = e.getElementsByTagName('td');
    return YearRecord(int.parse(children[0].text), children[1].text,
        int.parse(children[1].text));
  }
}
