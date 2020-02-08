import 'package:flutter/material.dart';

class Movie {
  String title;
  String original;
  String kbRef;

  Movie({@required this.title, this.original, this.kbRef});
}

class YearRecord {
  int pos;
  String title;
  int boxOffice;
  String original;
  String distributor;

  YearRecord({@required this.pos,
    @required this.title,
    @required this.boxOffice,
    this.original,
    this.distributor});
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
