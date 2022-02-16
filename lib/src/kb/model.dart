import 'package:flutter/material.dart';

class Movie {
  String? title;
  String? original;
  String? kbRef;
  String? poster;
  List<String> genres;
  String? description;

  Movie({@required this.title,
    this.original,
    this.kbRef,
    this.poster,
    this.genres = List<String>.empty(),
    this.description});
}

class Note {
  String? id;
  String? title;
  String? description;

  Note(this.id = "", this.title = "", this.description = "");

  Note.map(dynamic obj) {
    this.id = obj['id'];
    this.title = obj['title'];
    this.description = obj['description'];
  }

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map['id'] = id;
    map['title'] = title;
    map['description'] = description;

    return map;
  }

  Note.fromMap(Map<String, dynamic> map) {
    this.id = map['id'];
    this.title = map['title'];
    this.description = map['description'];
  }
}

class Worker {
  String id;
  DateTime lastWorked;

  Worker(this.id, this.lastWorked);

  Worker.map(dynamic obj) {
    this.id = obj['id'];
    this.lastWorked = obj['lastWorked'];
  }

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    if (id != null) {
      map['id'] = id;
    }
    map['lastWorked'] = lastWorked;

    return map;
  }

  Worker.fromMap(Map<String, dynamic> map) {
    this.id = map['id'];
    this.lastWorked = map['lastWorked'];
  }
}

class YearRecord {
  var id;
  int pos;
  String title;
  int boxOffice;
  int boxOfficeUsd;
  String? original;
  String? distributor;
  int screens;
  int spectaculars;
  String? kbRef;

  YearRecord({@required this.pos,
    @required this.title,
    @required this.boxOffice,
    this.boxOfficeUsd,
    this.original,
    this.distributor,
    this.screens,
    this.spectaculars,
    this.kbRef});

  YearRecord.map(dynamic obj) {
    this.pos = obj['pos'];
    this.title = obj['title'];
    this.boxOffice = obj['boxOffice'];
    this.boxOfficeUsd = obj['boxOfficeUsd'];
    this.original = obj['original'];
    this.distributor = obj['distributor'];
    this.screens = obj['screens'];
    this.spectaculars = obj['spectaculars'];
    this.kbRef = obj['kbRef'];
  }

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    if (id != null) {
      map['id'] = id;
    }
    map['pos'] = this.pos;
    map['title'] = this.title;
    map['boxOffice'] = this.boxOffice;
    map['boxOfficeUsd'] = this.boxOfficeUsd;
    map['original'] = this.original;
    map['distributor'] = this.distributor;
    map['screens'] = this.screens;
    map['spectaculars'] = this.spectaculars;
    map['kbRef'] = this.kbRef;

    return map;
  }

  YearRecord.fromMap(Map<String, dynamic> map) {
    this._id = map['id'];
    this.pos = map['pos'];
    this.title = map['title'];
    this.boxOffice = map['boxOffice'];
    this.boxOfficeUsd = map['boxOfficeUsd'];
    this.original = map['original'];
    this.distributor = map['distributor'];
    this.screens = map['screens'];
    this.spectaculars = map['spectaculars'];
    this.kbRef = map['kbRef'];
  }
}

class WeekendRecord {
  int pos;
  String title;
  int boxOffice;
  String? kbRef;

  WeekendRecord({this.pos, this.title, this.boxOffice, this.kbRef});
}

class ThursdayRecord {
  int pos;
  String title;
  int boxOffice;

  ThursdayRecord(this.pos, this.title, this.boxOffice);
}
