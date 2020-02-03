import 'dart:collection';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:provider/provider.dart';
import 'package:flutter/foundation.dart';
import 'package:html/dom.dart' as dom;
import 'package:html/parser.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'src/kb.dart';

void main() => runApp(MyApp());

class News with ChangeNotifier {
  bool _loading = false;
  String _news;
  final List<String> _titles = [];

  News() {
    var rng = new Random();
    if (rng.nextInt(100) > 50) {
      addWeekBoxOffice();
    } else {
      addYearBoxOffice();
    }
  }

  getLoading() => _loading;

  getNews() => _news;

  setNews(String news) => _news = news;

  getTitles() => _titles;

  UnmodifiableListView<String> get titles => UnmodifiableListView(_titles);

  void addYearBoxOffice() async {
    _loading = true;
    _news = "...";
    notifyListeners();
    try {
      Dio dio = new Dio();
      var response =
          await dio.get('http://kinobusiness.com/kassovye_sbory/films_year/');
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
      rows.map(toRec);
      _titles.clear();
      _titles.addAll(rows.map(toRec).toList());
    } catch (exception) {
      _loading = false;
      _news = "ERROR - " + exception.runtimeType.toString();
      notifyListeners();
    }
  }

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
      rows.map(toRec);
      _titles.clear();
      _titles.addAll(rows.map(toRec2).toList());
    } catch (exception) {
      _loading = false;
      _news = "ERROR - " + exception.runtimeType.toString();
      notifyListeners();
    }
  }

  String toRec(dom.Element e) {
    var children = e.getElementsByTagName('td');
    //var t = '';
    //children.forEach((c) => {t = t + c.text});
    return children[1].text + '\r\n' + children[5].text;
  }

  String toRec2(dom.Element e) {
    var children = e.getElementsByTagName('td');
    //var t = '';
    //children.forEach((c) => {t = t + c.text});
    return children[3].text + '\r\n' + children[6].text;
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'kb-app',
        theme: ThemeData(
          primarySwatch: Colors.indigo,
        ),
        home: ChangeNotifierProvider<BottomNavigationBarProvider>(
          create: (_) => BottomNavigationBarProvider(),
          child: BoxOfficePage(),
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
    final news = Provider.of<News>(context);
    return ListView.separated(
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
              Text('${index + 1}',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30)),
              SizedBox(
                width: 12,
              ),
              Flexible(
                child: Text('${news.titles[index]}',
                    style: TextStyle(
                        //color: Colors.white,
                        fontWeight: FontWeight.normal,
                        fontSize: 19)),
              ),
            ],
          ),
        );
      },
      separatorBuilder: (BuildContext context, int index) => const Divider(),
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
      body: Text('${provider.currentTitle}'),
      bottomNavigationBar: new BottomNavigationBar(
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
