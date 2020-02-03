import 'dart:async';
import 'dart:developer' as developer;

import 'package:dio/dio.dart';
import 'package:html/dom.dart' as dom;
import 'package:html/parser.dart';

class YearRecord {
  int pos;
  String title;
  int boxOffice;

  YearRecord(this.pos, this.title, this.boxOffice);
}

class WeekendRecord {
  int pos;
  String title;
  int boxOffice;

  WeekendRecord(this.pos, this.title, this.boxOffice);
}

class ThursdayRecord {
  int pos;
  String title;
  int boxOffice;

  ThursdayRecord(this.pos, this.title, this.boxOffice);
}

class KbApi {
  static final yearBoxOffice =
      'http://kinobusiness.com/kassovye_sbory/films_year/';
  static Dio dio = Dio();

  Future<List<YearRecord>> getYearBoxOffice() async {
    try {
      //return <YearRecord>[YearRecord(1, 'TEST', 1)];
      var response = await dio.get(yearBoxOffice);
      var document = parse(response.data.toString());
      List<dom.Element> rows =
      document.querySelectorAll('table#krestable > tbody  > tr');
      developer.log('ELEMENTS: ${rows.length}');
      return rows.map(toRec).toList();
    } catch (exception) {
      developer.log(exception.toString());
      return <YearRecord>[];
    }
  }

  YearRecord toRec(dom.Element e) {
    var children = e.getElementsByTagName('td');
    return YearRecord(
        int.parse(children[0].text.trim()),
        children[1].text.trim(),
        int.tryParse(children[5].text.trim().replaceAll((' '), '')) ?? 0);
  }

Future<List<WeekendRecord>> getWeekendBoxOffice() async {
    try {
      //return <YearRecord>[YearRecord(1, 'TEST', 1)];
      var response = await dio.get(yearBoxOffice);
      var document = parse(response.data.toString());
      List<dom.Element> rows =
      document.querySelectorAll('table#krestable > tbody  > tr');
      developer.log('ELEMENTS: ${rows.length}');
      return rows.map(toRec2).toList();
    } catch (exception) {
      developer.log(exception.toString());
      return <WeekendRecord>[];
    }
  }

  WeekendRecord toRec2(dom.Element e) {
    var children = e.getElementsByTagName('td');
    return WeekendRecord(
        int.parse(children[0].text.trim()),
        children[3].text.trim(),
        int.tryParse(children[6].text.trim().replaceAll((' '), '')) ?? 0);
  }

Future<List<ThursdayRecord>> getThursdayBoxOffice() async {
    try {
      //return <YearRecord>[YearRecord(1, 'TEST', 1)];
      var response = await dio.get(yearBoxOffice);
      var document = parse(response.data.toString());
      List<dom.Element> rows =
      document.querySelectorAll('table#krestable > tbody  > tr');
      developer.log('ELEMENTS: ${rows.length}');
      return rows.map(toRec3).toList();
    } catch (exception) {
      developer.log(exception.toString());
      return <ThursdayRecord>[];
    }
  }

  ThursdayRecord toRec3(dom.Element e) {
    var children = e.getElementsByTagName('td');
    return ThursdayRecord(
        int.parse(children[0].text.trim()),
        children[3].text.trim(),
        int.tryParse(children[6].text.trim().replaceAll((' '), '')) ?? 0);
  }
}
