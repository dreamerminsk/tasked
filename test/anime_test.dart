import 'dart:convert';
import 'dart:io';

import 'package:tasked/src/home/entities/anime.dart';

//import 'package:html/dom.dart' as dom;
//import 'package:html/parser.dart';

import 'package:test/test.dart';

void main() {
  final file = new File('data/wiki.anime.json');

  test('wiki.anime.json is exists', () {
    expect(file.existsSync(), true);
  });

  final jsonString = file.readAsStringSync();

  test('wiki.anime.json is readable', () {
    expect(jsonString.length, greaterThan(0));
  });

  final jsonList = jsonDecode(jsonString);

  test('wiki.anime.json is parceable', () {
    expect(jsonList.length, 89);
  });

  test('animeList is parceable', () {
    final animeList = jsonList.map((i) => Anime.fromJson(i)).toList();
    expect(animeList.length, 89);
    expect(animeList[0].title?.length ?? 0, greaterThan(0));
  });
}
