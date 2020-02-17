import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:kbapp/src/kb/kb.dart';
import 'package:kbapp/src/kb/model.dart';
import 'package:kbapp/src/utils/formatters.dart';
import 'package:provider/provider.dart';

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
                        color: Theme.of(context).bottomAppBarColor,
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
                                '${decimalFormatter.format(thursday.titles[index - 1].boxOffice)}',
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
