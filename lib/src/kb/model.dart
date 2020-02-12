import 'package:flutter/material.dart';

class Movie {
  String title;
  String original;
  String kbRef;
  String poster;
  List<String> genres;
  String description;

  Movie(
      {@required this.title, this.original, this.kbRef, this.poster, this.genres, this.description});
}

class YearRecord {
  final int pos;
  final String title;
  final int boxOffice;
  final int boxOfficeUsd;
  final String original;
  final String distributor;
  final int screens;
  final int spectaculars;
  final String kbRef;

  YearRecord({@required this.pos,
    @required this.title,
    @required this.boxOffice,
    this.boxOfficeUsd,
    this.original,
    this.distributor,
    this.screens,
    this.spectaculars,
    this.kbRef});
}

class WeekendRecord {
  int pos;
  String title;
  int boxOffice;
  String kbRef;

  WeekendRecord({this.pos, this.title, this.boxOffice, this.kbRef});
}

class ThursdayRecord {
  int pos;
  String title;
  int boxOffice;

  ThursdayRecord(this.pos, this.title, this.boxOffice);
}
