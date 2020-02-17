import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:kbapp/src/kb/kb.dart';
import 'package:kbapp/src/kb/model.dart';
import 'package:kbapp/src/utils/formatters.dart';
import 'package:provider/provider.dart';

import 'movie_page.dart';

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
                  child: InkWell(
                    onTap: () {
                      Route route = MaterialPageRoute(
                          builder: (context) =>
                              MoviePage(Movie(
                                title: weekend.titles[index - 1].title,
                                //original: weekend.titles[index-1].original,
                                kbRef: weekend.titles[index - 1].kbRef,
                              )));
                      Navigator.push(context, route);
                    },
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
                                  '${decimalFormatter.format(weekend
                                      .titles[index - 1].boxOffice)}',
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
                  ),
                );
            },
            //separatorBuilder: (BuildContext context, int index) => const Divider(),
          );
  }
}
