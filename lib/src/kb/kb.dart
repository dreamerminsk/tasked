import 'dart:async';
import 'dart:developer' as developer;
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:html/dom.dart' as dom;
import 'package:html/parser.dart';

import 'package:kb_dart/src/utils/strings.dart';

import '../utils/formatters.dart';
import 'model.dart';

class KbApi {
  static final kbHost = 'http://kinobusiness.com';

  static final yearBoxOffice = '$kbHost/kassovye_sbory/films_year/';

  static final weekendBoxOffice = '$kbHost/kassovye_sbory/weekend/';

  static final thursdayBoxOffice = '$kbHost/kassovye_sbory/thursday/';

  static final Dio dio = Dio(BaseOptions(
    connectTimeout: 15000,
    receiveTimeout: 100000,
    headers: {
      HttpHeaders.userAgentHeader:
      "Mozilla/5.0 (Windows NT 6.1; WOW64; rv:64.0) Gecko/20100101 Firefox/64.0",
    },
  ));

  Future<List<YearRecord>> getYearBoxOffice() async {
    try {
      var response = await dio.get(yearBoxOffice);
      var document = parse(response.data.toString());
      List<dom.Element> rows =
      document.querySelectorAll('table#krestable > tbody  > tr');
      developer.log('ELEMENTS: ${rows.length}');
      var years = rows.map(parseYearRec).toList();
      return years;
    } catch (exception) {
      developer.log(exception.toString());
      return <YearRecord>[];
    }
  }

  YearRecord parseYearRec(dom.Element e) {
    var children = e.getElementsByTagName('td');
    developer.log(trim(children[6].text));
    final movieRef = children[1].querySelector('b > a');
    return YearRecord(
      pos: int.parse(children[0].text.trim()),
      title: children[1].text.trim(),
      boxOffice: int.tryParse(trim(children[5].text)) ?? 0,
      boxOfficeUsd: int.tryParse(trim(children[6].text)) ?? 0,
      original: children[2].text.trim(),
      distributor: children[3].text.trim(),
      screens: int.tryParse(trim(children[4].text)) ?? 0,
      spectaculars: int.tryParse(trim(children[7].text)) ?? 0,
      kbRef: movieRef == null ? null : movieRef.attributes['href'],
    );
  }

  Future<List<DateTime>> getWeekends() async {
    try {
      String url = '$weekendBoxOffice';
      var response = await dio.get(url);
      var document = parse(response.data.toString());
      List<dom.Element> rows = document.querySelectorAll(
          'table.calendar_year > tbody > tr > td > center > a[href]');
      developer.log('ELEMENTS: ${rows.length}');
      var ds = rows.map((item) {
        var parts = item.attributes['href']?.trim().split("/");
        return fullDateFormatter.parse(parts?[parts.length - 2] ?? "01.01.0001");
      }).toList();
      return ds;
    } catch (exception) {
      developer.log(exception.toString());
      return <DateTime>[];
    }
  }

  Future<List<WeekendRecord>> getWeekendBoxOffice(DateTime day) async {
    try {
      String url =
          '$weekendBoxOffice${yearFormatter.format(day)}/${fullDateFormatter
          .format(day)}/';
      developer.log(url);
      var response = await dio.get(url);
      var document = parse(response.data.toString());
      List<dom.Element> rows =
      document.querySelectorAll('table#krestable > tbody  > tr');
      developer.log('ELEMENTS: ${rows.length}');
      return rows.map(parseWeekendRec).toList();
    } catch (exception) {
      developer.log(exception.toString());
      return <WeekendRecord>[];
    }
  }

  WeekendRecord parseWeekendRec(dom.Element e) {
    var children = e.getElementsByTagName('td');
    final movieRef = children[3].querySelector('b > a');
    return WeekendRecord(
      pos: int.parse(children[1].text.trim()),
      title: children[3].text.trim(),
      boxOffice: int.tryParse(trim(children[6].text)) ?? 0,
      kbRef: movieRef == null ? null : movieRef.attributes['href'],
    );
  }

  Future<List<DateTime>> getThursdays() async {
    try {
      String url = '$thursdayBoxOffice';
      var response = await dio.get(url);
      var document = parse(response.data.toString());
      List<dom.Element> rows = document.querySelectorAll(
          'table.calendar_year > tbody > tr > td > center > a[href]');
      developer.log('ELEMENTS: ${rows.length}');
      var ds = rows.map((item) {
        var parts = item.attributes['href']?.trim().split("/");
        //developer.log('PARTS: ${parts?.length}');
        return fullDateFormatter.parse(parts?[parts.length - 2] ?? "01.01.0001");
      }).toList();
      return ds;
    } catch (exception) {
      developer.log(exception.toString());
      return <DateTime>[];
    }
  }

  Future<List<ThursdayRecord>> getThursdayBoxOffice(DateTime day) async {
    developer.log('getThursdayBoxOffice');
    try {
      String url =
          '$thursdayBoxOffice${yearFormatter.format(day)}/${fullDateFormatter
          .format(day)}/';
      developer.log(url);
      var response = await dio.get(url);
      var document = parse(response.data.toString());
      List<dom.Element> rows = document.querySelectorAll(
          'section.events__table > div > table > tbody > tr[id]');
      developer.log('ELEMENTS: ${rows.length}');
      var ds = rows.map(parseThursdayRec).toList();
      return ds;
    } catch (exception) {
      developer.log(exception.toString());
      return <ThursdayRecord>[];
    }
  }

  ThursdayRecord parseThursdayRec(dom.Element e) {
    var children = e.getElementsByTagName('td');
    return ThursdayRecord(int.parse(pos: children[0].text.trim()),
        title: children[1].text.trim(), boxOffice: int.tryParse(trim(children[3].text)) ?? 0);
  }

  Future<Movie> getMovie(String ref) async {
    try {
      String url = '$kbHost$ref';
      var response = await dio.get(url);
      var document = parse(response.data.toString());
      var posterImg =
      document.querySelector('div.film__picture > figure > img');
      var genres = document
          .querySelectorAll('span[itemprop=' 'genre' ']')
          .map((item) => item.text.trim())
          .toList();

      var desc = document
          .querySelector('span[itemprop="description"]')
          ?.text;
      return Movie(
        kbRef: ref,
        title: "",
        poster: '$kbHost${posterImg?.attributes['src']}',
        genres: genres,
        description: desc,
      );
    } catch (exception) {
      developer.log(exception.toString());
      return Movie(kbRef: ref, title: "");
    }
  }
}
