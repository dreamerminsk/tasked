import 'dart:collection';
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
    addNews();
  }

  getLoading() => _loading;

  getNews() => _news;

  setNews(String news) => _news = news;

  getTitles() => _titles;

  UnmodifiableListView<String> get titles => UnmodifiableListView(_titles);

  void addNews() async {
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

  String toRec(dom.Element e) {
    var children = e.getElementsByTagName('td');
    //var t = '';
    //children.forEach((c) => {t = t + c.text});
    return children[1].text + '\r\n' + children[5].text;
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'NEWS',
        theme: ThemeData(
          primarySwatch: Colors.indigo,
        ),
        home: ChangeNotifierProvider<News>(
          create: (_) => News(),
          child: NewsPage(),
        ));
  }
}

class NewsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final news = Provider.of<News>(context);
    return Scaffold(
      appBar: AppBar(title: Text('${news.getNews()}'), actions: <Widget>[
        // action button
        IconButton(
          icon: Icon(Icons.autorenew),
          onPressed: () async {
            news.addNews();
          },
        ),
      ]),
      body: news.getLoading()
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  LoadingIndicator(
                    indicatorType: Indicator.ballClipRotateMultiple,
                  ),
                ],
              ),
            )
          : ListView.separated(
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
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 28)),
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
              separatorBuilder: (BuildContext context, int index) =>
                  const Divider(),
            ),
    );
  }
}
