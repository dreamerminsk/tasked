import 'dart:async';
import 'dart:collection';
import 'dart:html';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kbapp/src/kb/kb.dart';
import 'package:kbapp/src/kb/model.dart';
import 'package:kbapp/src/services/firestore_service.dart';
import 'package:provider/provider.dart';

import '../utils/formatters.dart';
import 'movie_page.dart';

class ThursdayModel with ChangeNotifier {
  KbApi kbApi = KbApi();
  bool _loading = false;
  int _current = 0;
  final List<ThursdayRecord> _titles = [];
  final List<DateTime> _thursdays = [];

  ThursdayModel() {
    loadDates();
    if (_thursdays.length > 0) {
      load();
    }
  }

  getLoading() => _loading;

  getTitles() => _titles;

  UnmodifiableListView<ThursdayRecord> get titles =>
      UnmodifiableListView(_titles);

  UnmodifiableListView<DateTime> get thursdays =>
      UnmodifiableListView(_thursdays);

  DateTime get current {
    if (_thursdays.length > _current) {
      return _thursdays[_current];
    } else {
      return null;
    }
  }

  DateTime get prev {
    if (_thursdays.length > (_current + 1)) {
      return _thursdays[_current + 1];
    } else {
      return null;
    }
  }

  DateTime get next {
    if ((_thursdays.length > (_current - 1)) && (_current > 0)) {
      return _thursdays[_current - 1];
    } else {
      return null;
    }
  }

  nextThursday() {
    if (_current > 0) {
      _current -= 1;
      load();
      notifyListeners();
    }
  }

  prevThursday() {
    if ((_current + 1) < _thursdays.length) {
      _current += 1;
      load();
      notifyListeners();
    }
  }

  void loadDates() async {
    _loading = true;
    notifyListeners();
    try {
      _thursdays.clear();
      _thursdays.addAll(await kbApi.getThursdays());
      notifyListeners();
    } catch (exception) {
      _loading = false;
      notifyListeners();
    }
  }

  void load() async {
    _loading = true;
    notifyListeners();
    try {
      _titles.clear();
      _titles.addAll(await kbApi.getThursdayBoxOffice(_thursdays[_current]));
      _loading = false;
      notifyListeners();
    } catch (exception) {
      _loading = false;
      notifyListeners();
    }
  }
}

class ThursdayBoxOffice extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final thursday = Provider.of<ThursdayModel>(context);
    return thursday.getLoading()
        ? Center(child: CircularProgressIndicator())
        : ListView.builder(
      shrinkWrap: true,
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      itemCount: thursday.titles.length + 1,
      itemBuilder: (BuildContext context, int index) {
        if (index == 0) {
          return ButtonBar(
              alignment: MainAxisAlignment.center,
              layoutBehavior: ButtonBarLayoutBehavior.constrained,
              buttonPadding:
              EdgeInsets.symmetric(vertical: 4, horizontal: 8),
              //buttonHeight: 21,
              children: <Widget>[
                RaisedButton(
                  child: Text(thursday.prev == null
                      ? ''
                      : '${fullDateFormatter.format(thursday.prev)}'),
                  onPressed: thursday.prev == null
                      ? null
                      : () {
                    thursday.prevThursday();
                  },
                ),
                RaisedButton(
                  color: Theme
                      .of(context)
                      .bottomAppBarColor,
                  //color:Colors.white,
                  //color: Colors.deepOrange,
                  child: Text(
                      '${fullDateFormatter.format(thursday.current)}'),
                  onPressed: thursday.current == null ? null : () {},
                ),
                RaisedButton(
                  child: Text(thursday.next == null
                      ? ''
                      : '${fullDateFormatter.format(thursday.next)}'),
                  onPressed: thursday.next == null
                      ? null
                      : () {
                    thursday.nextThursday();
                  },
                ),
              ]);
        } else
          return Card(
            //color: Colors.indigo,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                SizedBox(
                  width: 6,
                ),
                Container(
                  width: 40,
                  child: Text('${thursday.titles[index - 1].pos}',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 21)),
                ),
                SizedBox(
                  width: 6,
                ),
                Flexible(
                  child: Column(
                    //mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Flexible(
                          child:
                          Text('${thursday.titles[index - 1].title}',
                              style: TextStyle(
                                //color: Colors.white,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 16))),
                      Text(
                          '${decimalFormatter.format(
                              thursday.titles[index - 1].boxOffice)}',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            //color: Colors.white,
                              fontWeight: FontWeight.w100,
                              fontSize: 18)),
                    ],
                  ),
                ),
              ],
            ),
          );
      },
      //separatorBuilder: (BuildContext context, int index) => const Divider(),
    );
  }
}

class WeekendModel with ChangeNotifier {
  KbApi kbApi = KbApi();
  bool _loading = false;
  final List<WeekendRecord> _titles = [];
  final List<DateTime> _weekends = [];

  WeekendModel() {
    load();
  }

  getLoading() => _loading;

  getTitles() => _titles;

  UnmodifiableListView<WeekendRecord> get titles =>
      UnmodifiableListView(_titles);

  UnmodifiableListView<DateTime> get weekends =>
      UnmodifiableListView(_weekends);

  void load() async {
    _loading = true;
    notifyListeners();
    try {
      _weekends.clear();
      _weekends.addAll(await kbApi.getWeekends());
      notifyListeners();
    } catch (exception) {}
    try {
      _titles.clear();
      _titles.addAll(await kbApi.getWeekendBoxOffice(weekends[0]));
      _loading = false;
      notifyListeners();
    } catch (exception) {
      _loading = false;
      notifyListeners();
    }
  }
}

class WeekendBoxOffice extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final weekend = Provider.of<WeekendModel>(context);
    return weekend.getLoading()
        ? Center(child: CircularProgressIndicator())
        : ListView.builder(
      shrinkWrap: true,
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      itemCount: weekend.titles.length + 1,
      itemBuilder: (BuildContext context, int index) {
        if (index == 0) {
          return Center(
              child: Text(
                  '${fullDateFormatter.format(weekend.weekends[0])}'));
        } else
          return Card(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                SizedBox(
                  width: 6,
                ),
                Container(
                  width: 40,
                  child: Text('${weekend.titles[index - 1].pos}',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 21)),
                ),
                SizedBox(
                  width: 6,
                ),
                Flexible(
                  child: Column(
                    //mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Flexible(
                          child:
                          Text('${weekend.titles[index - 1].title}',
                              style: TextStyle(
                                //color: Colors.white,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 16))),
                      Text(
                          '${decimalFormatter.format(
                              weekend.titles[index - 1].boxOffice)}',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            //color: Colors.white,
                              fontWeight: FontWeight.w100,
                              fontSize: 18)),
                    ],
                  ),
                ),
              ],
            ),
          );
      },
      //separatorBuilder: (BuildContext context, int index) => const Divider(),
    );
  }
}

class YearModel with ChangeNotifier {
  KbApi kbApi = KbApi();
  bool _loading = false;
  final List<YearRecord> _titles = [];

  YearModel() {
    load();
  }

  getLoading() => _loading;

  getTitles() => _titles;

  UnmodifiableListView<YearRecord> get titles => UnmodifiableListView(_titles);

  void load() async {
    _loading = true;
    notifyListeners();
    try {
      _titles.clear();
      _titles.addAll(await kbApi.getYearBoxOffice());
      notifyListeners();
    } catch (exception) {
      _loading = false;
      notifyListeners();
    }
  }
}

class YearBoxOffice extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final year = Provider.of<YearModel>(context);
    return ListView.builder(
      shrinkWrap: true,
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      itemCount: year.titles.length,
      itemBuilder: (BuildContext context, int index) {
        return Card(
          child: InkWell(
            onTap: () {
              Route route = MaterialPageRoute(
                  builder: (context) => MoviePage(year.titles[index]));
              Navigator.push(context, route);
            },
            child: Padding(
              padding: EdgeInsets.symmetric(
                vertical: 5.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  SizedBox(
                    width: 6,
                  ),
                  Container(
                    width: 50,
                    child: Text('${year.titles[index].pos}',
                        textAlign: TextAlign.center,
                        style: Theme
                            .of(context)
                            .textTheme
                            .headline),
                  ),
                  SizedBox(
                    width: 6,
                  ),
                  Flexible(
                    child: Column(
                      //mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Flexible(
                            child: Text('${year.titles[index].title}',
                                style: Theme
                                    .of(context)
                                    .textTheme
                                    .title)),
                        Flexible(
                            child: Text('${year.titles[index].distributor}',
                                style: Theme
                                    .of(context)
                                    .textTheme
                                    .subtitle)),
                        Table(children: [
                          TableRow(children: [
                            TableCell(
                              child: Text(
                                  '₽ ${decimalFormatter.format(
                                      year.titles[index].boxOffice)}',
                                  textAlign: TextAlign.left,
                                  style: Theme
                                      .of(context)
                                      .textTheme
                                      .subhead),
                            ),
                            TableCell(
                              child: Text(
                                  '${decimalFormatter.format(
                                      year.titles[index].spectaculars)}',
                                  textAlign: TextAlign.left,
                                  style: Theme
                                      .of(context)
                                      .textTheme
                                      .subhead),
                            ),
                          ]),
                          TableRow(children: [
                            TableCell(
                              child: Text(
                                  '\$ ${decimalFormatter.format(
                                      year.titles[index].boxOfficeUsd ?? 0)}',
                                  textAlign: TextAlign.left,
                                  style: Theme
                                      .of(context)
                                      .textTheme
                                      .subhead),
                            ),
                            TableCell(
                              child: Text(
                                  '${decimalFormatter.format(
                                      year.titles[index].screens)}',
                                  textAlign: TextAlign.left,
                                  style: Theme
                                      .of(context)
                                      .textTheme
                                      .subhead),
                            ),
                          ])
                        ]),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
      //separatorBuilder: (BuildContext context, int index) => const Divider(),
    );
  }
}

class BoxOfficeHomeModel with ChangeNotifier {
  List<YearRecord> items;
  FirestoreService db = new FirestoreService();

  StreamSubscription<QuerySnapshot> yearSub;

  BoxOfficeHomeModel() {
    initState();
  }

  void initState() {
    items = new List();

    yearSub?.cancel();
    yearSub = db.getYearList().listen((QuerySnapshot snapshot) {
      final List<YearRecord> years = snapshot.documents
          .map((documentSnapshot) => YearRecord.fromMap(documentSnapshot.data))
          .toList();

      this.items = years;
      notifyListeners();
    });
  }

  @override
  void dispose() {
    yearSub?.cancel();
    super.dispose();
  }
}

class BoxOfficeHome extends StatelessWidget {
  final items = <String>['ЧЕТВЕРГ', 'УИКЕНД', 'ГОД', 'ДИСТРИБЬЮТОРЫ'];
  final headers = <Widget>[];

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => BoxOfficeHomeModel(),
        child: Consumer<BoxOfficeHomeModel>(
            builder: (context, model, child) =>
                ListView.builder(
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Column(
                        children: <Widget>[
                          Text(
                            '${items[index]}',
                            style: Theme
                                .of(context)
                                .textTheme
                                .body2,
                          ),
                          ListView.builder(
                            shrinkWrap: true,
                            physics: ClampingScrollPhysics(),
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: EdgeInsets.only(top: 8.0),
                                child: index == 2
                                    ? Text(
                                    '${model.items[index].title} / ${model
                                        .items[index].boxOffice}')
                                    : Text('Nested list item $index'),
                              );
                            },
                            itemCount: 10, // this is a hardcoded value
                          ),
                        ],
                      ),
                    );
                  },
                  itemCount: items.length, // this is a hardcoded value
                )));
  }
}

class BottomNavigationBarProvider with ChangeNotifier {
  int _currentIndex = 0;

  List<String> _titles = <String>['БОКСОФИС', 'АФИША', 'УИКЕНД', 'ГОД'];

  List<Widget> _widgets = <Widget>[
    BoxOfficeHome(),
    ComingSoonPage(),
    WeekendBoxOffice(),
    YearBoxOffice()
  ];

  get currentIndex => _currentIndex;

  get currentTitle => _titles[_currentIndex];

  get currentWidget => _widgets[_currentIndex];

  get loading => false;

  set currentIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }

  update() {
    if (currentWidget is YearBoxOffice) {
      //(currentWidget as YearBoxOffice).update();
    }
  }
}

class ComingSoonPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('NOT IMPLEMENTED YET'));
  }
}

class BoxOfficePage extends StatelessWidget {
  final rng = new Random();

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<BottomNavigationBarProvider>(context);
    return Scaffold(
      appBar: AppBar(title: Text('${provider.currentTitle}'), actions: <Widget>[
        // action button
        IconButton(
          icon: Icon(Icons.autorenew),
          onPressed: () async {
            var idx = provider.currentIndex;
            if (idx == 2) {
              Provider.of<WeekendModel>(context, listen: false).load();
            } else if (idx == 3) {
              Provider.of<YearModel>(context, listen: false).load();
            }
          },
        ),
      ]),
      body: provider.currentWidget,
      bottomNavigationBar: new BottomNavigationBar(
        selectedItemColor: Colors.deepOrange,
        //backgroundColor: Colors.indigoAccent,
        currentIndex: provider.currentIndex,
        onTap: (index) {
          provider.currentIndex = index;
        },
        items: <BottomNavigationBarItem>[
          new BottomNavigationBarItem(
              icon: const Icon(Icons.monetization_on),
              title: new Text("БОКСОФИС")),
          new BottomNavigationBarItem(
              icon: const Icon(Icons.movie), title: new Text("АФИША")),
          new BottomNavigationBarItem(
              icon: const Icon(Icons.calendar_today),
              title: new Text("УИКЕНД")),
          new BottomNavigationBarItem(
              icon: const Icon(Icons.date_range), title: new Text("ГОД"))
        ],
      ),
    );
  }
}
