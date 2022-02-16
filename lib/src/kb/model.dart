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
    this.genres,
    this.description});
}

class Note {
  String _id;
  String _title;
  String _description;

  Note(this._id, this._title, this._description);

  Note.map(dynamic obj) {
    this._id = obj['id'];
    this._title = obj['title'];
    this._description = obj['description'];
  }

  String get id => _id;

  String get title => _title;

  String get description => _description;

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    if (_id != null) {
      map['id'] = _id;
    }
    map['title'] = _title;
    map['description'] = _description;

    return map;
  }

  Note.fromMap(Map<String, dynamic> map) {
    this._id = map['id'];
    this._title = map['title'];
    this._description = map['description'];
  }
}

class Worker {
  String _id;
  DateTime _lastWorked;

  Worker(this._id, this._lastWorked);

  Worker.map(dynamic obj) {
    this._id = obj['id'];
    this._lastWorked = obj['lastWorked'];
  }

  String get id => _id;

  DateTime get description => _lastWorked;

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    if (_id != null) {
      map['id'] = _id;
    }
    map['lastWorked'] = _lastWorked;

    return map;
  }

  Worker.fromMap(Map<String, dynamic> map) {
    this._id = map['id'];
    this._lastWorked = map['lastWorked'];
  }
}

class YearRecord {
  var _id;
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

  String get id => _id;

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    if (_id != null) {
      map['id'] = _id;
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
