import 'dart:collection';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import 'src/kb.dart';

void main() => runApp(MyApp());

class ThursdayModel with ChangeNotifier {
  KbApi kbApi = KbApi();
  bool _loading = false;
  final List<ThursdayRecord> _titles = [];

  ThursdayModel() {
    load();
  }

  getLoading() => _loading;

  getTitles() => _titles;

  UnmodifiableListView<ThursdayRecord> get titles =>
      UnmodifiableListView(_titles);

  void load() async {
    _loading = true;
    notifyListeners();
    try {
      _titles.clear();
      _titles.addAll(await kbApi.getThursdayBoxOffice(DateTime(2020, 1, 30)));
      _loading = false;
      notifyListeners();
    } catch (exception) {
      _loading = false;
      notifyListeners();
    }
  }
}

class WeekendModel with ChangeNotifier {
  KbApi kbApi = KbApi();
  bool _loading = false;
  final List<WeekendRecord> _titles = [];

  WeekendModel() {
    load();
  }

  getLoading() => _loading;

  getTitles() => _titles;

  UnmodifiableListView<WeekendRecord> get titles =>
      UnmodifiableListView(_titles);

  void load() async {
    _loading = true;
    notifyListeners();
    try {
      _titles.clear();
      _titles.addAll(await kbApi.getWeekendBoxOffice(DateTime(2020, 1, 26)));
      notifyListeners();
    } catch (exception) {
      _loading = false;
      notifyListeners();
    }
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

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<BottomNavigationBarProvider>(
              create: (context) => BottomNavigationBarProvider()),
          ChangeNotifierProvider<YearModel>(create: (context) => YearModel()),
          ChangeNotifierProvider<WeekendModel>(
              create: (context) => WeekendModel()),
          ChangeNotifierProvider<ThursdayModel>(
              create: (context) => ThursdayModel()),
        ],
        child: MaterialApp(
          title: 'kb-app',
          theme: ThemeData(
            primarySwatch: Colors.indigo,
          ),
          home: BoxOfficePage(),
        ));
  }
}

mixin Updatable {}

class ThursdayBoxOffice extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final thursday = Provider.of<ThursdayModel>(context);
    var oCcy = new NumberFormat("#,##0", "en_US");
    return thursday.getLoading()
        ? Center(child: CircularProgressIndicator())
        : ListView.builder(
      shrinkWrap: true,
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      itemCount: thursday.titles.length,
      itemBuilder: (BuildContext context, int index) {
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
                child: Text('${thursday.titles[index].pos}',
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
                        child: Text('${thursday.titles[index].title}',
                            style: TextStyle(
                              //color: Colors.white,
                                fontWeight: FontWeight.normal,
                                fontSize: 16))),
                    Text(
                        '${oCcy.format(thursday.titles[index].boxOffice)}',
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

class WeekendBoxOffice extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final weekend = Provider.of<WeekendModel>(context);
    var oCcy = new NumberFormat("#,##0", "en_US");
    return ListView.builder(
      shrinkWrap: true,
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      itemCount: weekend.titles.length,
      itemBuilder: (BuildContext context, int index) {
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
                child: Text('${weekend.titles[index].pos}',
                    textAlign: TextAlign.center,
                    style:
                    TextStyle(fontWeight: FontWeight.bold, fontSize: 21)),
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
                        child: Text('${weekend.titles[index].title}',
                            style: TextStyle(
                              //color: Colors.white,
                                fontWeight: FontWeight.normal,
                                fontSize: 16))),
                    Text('${oCcy.format(weekend.titles[index].boxOffice)}',
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

class YearBoxOffice extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final year = Provider.of<YearModel>(context);
    var oCcy = new NumberFormat("#,##0", "en_US");
    return ListView.builder(
      shrinkWrap: true,
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      itemCount: year.titles.length,
      itemBuilder: (BuildContext context, int index) {
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
                child: Text('${year.titles[index].pos}',
                    textAlign: TextAlign.center,
                    style:
                    TextStyle(fontWeight: FontWeight.bold, fontSize: 21)),
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
                            style: TextStyle(
                              //color: Colors.white,
                                fontWeight: FontWeight.normal,
                                fontSize: 16))),
                    Text('${oCcy.format(year.titles[index].boxOffice)}',
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

class BottomNavigationBarProvider with ChangeNotifier {
  int _currentIndex = 0;

  List<String> _titles = <String>['THURSDAY', 'WEEKEND', 'YEAR'];

  List<Widget> _widgets = <Widget>[
    ThursdayBoxOffice(),
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
            if (idx == 0) {
              Provider.of<ThursdayModel>(context, listen: false).load();
            } else if (idx == 1) {
              Provider.of<WeekendModel>(context, listen: false).load();
            } else if (idx == 2) {
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
              icon: const Icon(Icons.today), title: new Text("THURSDAY")),
          new BottomNavigationBarItem(
              icon: const Icon(Icons.calendar_today),
              title: new Text("WEEKEND")),
          new BottomNavigationBarItem(
              icon: const Icon(Icons.date_range), title: new Text("YEAR"))
        ],
      ),
    );
  }
}
