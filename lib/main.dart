import 'dart:collection';
import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';
import 'package:html/dom.dart' as dom;
import 'package:html/parser.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import 'src/kb.dart';

void main() => runApp(MyApp());

class ThursdayModel with ChangeNotifier {
  bool _loading = false;
  String _news;
  final List<String> _titles = [];

  ThursdayModel() {}

  getLoading() => _loading;

  getNews() => _news;

  setNews(String news) => _news = news;

  getTitles() => _titles;

  UnmodifiableListView<String> get titles => UnmodifiableListView(_titles);

  void addWeekBoxOffice() async {
    _loading = true;
    _news = "...";
    notifyListeners();
    try {
      Dio dio = new Dio();
      var response = await dio.get(
          'http://kinobusiness.com/kassovye_sbory/weekend/2020/26.01.2020/');
      var document = parse(response.data.toString());
      List<dom.Element> links = document.querySelectorAll('title');
      _loading = false;
      _news = links[0].text;
      notifyListeners();
      List<dom.Element> ms = document
          .querySelectorAll('table#krestable > tbody  > tr > td > b > a');
      _titles.clear();
      _titles.addAll(ms.map((e) => e.text).toList());
      List<dom.Element> rows =
          document.querySelectorAll('table#krestable > tbody  > tr');
      rows.map(toRec2);
      _titles.clear();
      _titles.addAll(rows.map(toRec2).toList());
    } catch (exception) {
      _loading = false;
      _news = "ERROR - " + exception.runtimeType.toString();
      notifyListeners();
    }
  }

  String toRec2(dom.Element e) {
    var children = e.getElementsByTagName('td');
    //var t = '';
    //children.forEach((c) => {t = t + c.text});
    return children[3].text + '\r\n' + children[6].text;
  }
}

class WeekendModel with ChangeNotifier {
  bool _loading = false;
  String _news;
  final List<String> _titles = [];

  WeekendModel() {}

  getLoading() => _loading;

  getNews() => _news;

  setNews(String news) => _news = news;

  getTitles() => _titles;

  UnmodifiableListView<String> get titles => UnmodifiableListView(_titles);

  void addWeekBoxOffice() async {
    _loading = true;
    _news = "...";
    notifyListeners();
    try {
      Dio dio = new Dio();
      var response = await dio.get(
          'http://kinobusiness.com/kassovye_sbory/weekend/2020/26.01.2020/');
      var document = parse(response.data.toString());
      List<dom.Element> links = document.querySelectorAll('title');
      _loading = false;
      _news = links[0].text;
      notifyListeners();
      List<dom.Element> ms = document
          .querySelectorAll('table#krestable > tbody  > tr > td > b > a');
      _titles.clear();
      _titles.addAll(ms.map((e) => e.text).toList());
      List<dom.Element> rows =
          document.querySelectorAll('table#krestable > tbody  > tr');
      rows.map(toRec2);
      _titles.clear();
      _titles.addAll(rows.map(toRec2).toList());
    } catch (exception) {
      _loading = false;
      _news = "ERROR - " + exception.runtimeType.toString();
      notifyListeners();
    }
  }

  String toRec2(dom.Element e) {
    var children = e.getElementsByTagName('td');
    //var t = '';
    //children.forEach((c) => {t = t + c.text});
    return children[3].text + '\r\n' + children[6].text;
  }
}

class YearModel with ChangeNotifier {
  KbApi kbApi = KbApi();
  bool _loading = false;
  final List<YearRecord> _titles = [];

  YearModel() {
    addYearBoxOffice();
  }

  getLoading() => _loading;

  getTitles() => _titles;

  UnmodifiableListView<YearRecord> get titles => UnmodifiableListView(_titles);

  void addYearBoxOffice() async {
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

class ThursdayBoxOffice extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('THURSDAY BOXOFFICE'),
    );
  }
}

class WeekendBoxOffice extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('WEEKEND BOXOFFICE'),
    );
  }
}

class YearBoxOffice extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final news = Provider.of<YearModel>(context);
    final oCcy = new NumberFormat("#,##0", "en_US");
    return ListView.builder(
      shrinkWrap: true,
      padding: const EdgeInsets.all(8),
      itemCount: news.titles.length,
      itemBuilder: (BuildContext context, int index) {
        return Card(
          //color: Colors.indigo,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              SizedBox(
                width: 8,
              ),
              Text('${news.titles[index].pos}',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26)),
              SizedBox(
                width: 12,
              ),
              Column(
                //mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Flexible(
                      child: Text('${news.titles[index].title}',
                          style: TextStyle(
                              //color: Colors.white,
                              fontWeight: FontWeight.normal,
                              fontSize: 16))),
                  Text('${oCcy.format(news.titles[index].boxOffice)}',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          //color: Colors.white,
                          fontWeight: FontWeight.w100,
                          fontSize: 18)),
                ],
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
            if (rng.nextInt(100) > 50) {
              //news.addWeekBoxOffice();
            } else {
              //news.addYearBoxOffice();
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
