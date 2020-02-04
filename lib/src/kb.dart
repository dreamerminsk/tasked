import 'dart:async';
import 'dart:developer' as developer;

import 'package:dio/dio.dart';
import 'package:html/dom.dart' as dom;
import 'package:html/parser.dart';
import 'package:intl/intl.dart';

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

  static final weekendBoxOffice =
      'http://kinobusiness.com/kassovye_sbory/weekend/';

  static final thursdayBoxOffice =
      'http://kinobusiness.com/kassovye_sbory/thursday/';

  static final fullDateFormatter = new DateFormat('dd.MM.yyyy');

  static final yearFormatter = new DateFormat('yyyy');

  static final Dio dio = Dio();

  Future<List<YearRecord>> getYearBoxOffice() async {
    try {
      var response = await dio.get(yearBoxOffice);
      var document = parse(response.data.toString());
      List<dom.Element> rows =
          document.querySelectorAll('table#krestable > tbody  > tr');
      developer.log('ELEMENTS: ${rows.length}');
      return rows.map(toYearRec).toList();
    } catch (exception) {
      developer.log(exception.toString());
      return <YearRecord>[];
    }
  }

  YearRecord toYearRec(dom.Element e) {
    var children = e.getElementsByTagName('td');
    return YearRecord(
        int.parse(children[0].text.trim()),
        children[1].text.trim(),
        int.tryParse(children[5].text.trim().replaceAll((' '), '')) ?? 0);
  }

  Future<List<WeekendRecord>> getWeekendBoxOffice(DateTime day) async {
    try {
      String url = '$weekendBoxOffice${yearFormatter.format(
          day)}/${fullDateFormatter.format(day)}/';
      developer.log(url);
      var response = await dio.get(url);
      var document = parse(response.data.toString());
      List<dom.Element> rows =
          document.querySelectorAll('table#krestable > tbody  > tr');
      developer.log('ELEMENTS: ${rows.length}');
      return rows.map(toWeekendRec).toList();
    } catch (exception) {
      developer.log(exception.toString());
      return <WeekendRecord>[];
    }
  }

  WeekendRecord toWeekendRec(dom.Element e) {
    var children = e.getElementsByTagName('td');
    return WeekendRecord(
        int.parse(children[1].text.trim()),
        children[3].text.trim(),
        int.tryParse(children[6].text.trim().replaceAll((' '), '')) ?? 0);
  }

  Future<List<ThursdayRecord>> getThursdayBoxOffice() async {
    try {
      var response = await dio.get(yearBoxOffice);
      var document = parse(response.data.toString());
      List<dom.Element> rows =
          document.querySelectorAll('table#krestable > tbody  > tr');
      developer.log('ELEMENTS: ${rows.length}');
      return rows.map(toThursdayRec).toList();
    } catch (exception) {
      developer.log(exception.toString());
      return <ThursdayRecord>[];
    }
  }

  ThursdayRecord toThursdayRec(dom.Element e) {
    var children = e.getElementsByTagName('td');
    return ThursdayRecord(
        int.parse(children[0].text.trim()),
        children[3].text.trim(),
        int.tryParse(children[6].text.trim().replaceAll((' '), '')) ?? 0);
  }
}
