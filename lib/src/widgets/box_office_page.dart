import 'dart:math';

import 'package:flutter/material.dart';
import 'package:kb_dart/src/kb/model.dart';
import 'package:provider/provider.dart';

import '../utils/formatters.dart';
import 'weekend_box_office_page.dart';
import 'year_box_office_page.dart';

class BoxOfficeHomeModel with ChangeNotifier {
  List<YearRecord> items = List.empty();

  BoxOfficeHomeModel() {
    initState();
  }

  void initState() {
    items = [];
  }

  @override
  void dispose() {
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
                  itemBuilder: (context, idx) {
                    return Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Column(
                        children: <Widget>[
                          Text(
                            '${items[idx]}',
                            style: Theme
                                .of(context)
                                .textTheme
                                .bodyText1,
                          ),
                          ListView.builder(
                            shrinkWrap: true,
                            physics: ClampingScrollPhysics(),
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: EdgeInsets.only(top: 8.0),
                                child: idx == 2
                                    ? Table(columnWidths: {
                                  0: FlexColumnWidth(2),
                                  1: FlexColumnWidth(14),
                                  2: FlexColumnWidth(6),
                                }, children: <TableRow>[
                                  TableRow(children: <Widget>[
                                    TableCell(
                                        child: Padding(
                                            padding: EdgeInsets.only(
                                                right: 8.0),
                                            child: Text('${index + 1}',
                                                textAlign:
                                                TextAlign.end))),
                                    TableCell(
                                        child: Text(
                                          '${model.items[index].title}',
                                          textAlign: TextAlign.start,
                                        )),
                                    TableCell(
                                        child: Text(
                                            '${decimalFormatter.format(
                                                model.items[index].boxOffice)}',
                                            textAlign: TextAlign.end))
                                  ])
                                ])
                                    : Text('$index. Нет информации'),
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

  int get currentIndex => _currentIndex;

  String get currentTitle => _titles[_currentIndex];

  Widget get currentWidget => _widgets[_currentIndex];

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
              label: "БОКСОФИС"),
          new BottomNavigationBarItem(
              icon: const Icon(Icons.movie), label: "АФИША"),
          new BottomNavigationBarItem(
              icon: const Icon(Icons.calendar_today),
              label: "УИКЕНД"),
          new BottomNavigationBarItem(
              icon: const Icon(Icons.date_range), label: "ГОД")
        ],
      ),
    );
  }
}
