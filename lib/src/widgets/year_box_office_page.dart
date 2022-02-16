import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:kb_dart/src/kb/kb.dart';
import 'package:kb_dart/src/kb/model.dart';
import 'package:kb_dart/src/utils/formatters.dart';
import 'package:provider/provider.dart';

import 'movie_page.dart';

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
                  builder: (context) =>
                      MoviePage(Movie(
                        title: year.titles[index].title,
                        original: year.titles[index].original,
                        kbRef: year.titles[index].kbRef,
                      )));
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
                        style: Theme.of(context).textTheme.headline5),
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
                                style: Theme.of(context).textTheme.headline6)),
                        Flexible(
                            child: Text('${year.titles[index].distributor}',
                                style: Theme.of(context).textTheme.subtitle2)),
                        Table(children: [
                          TableRow(children: [
                            TableCell(
                              child: Text(
                                  '₽ ${decimalFormatter.format(year.titles[index].boxOffice)}',
                                  textAlign: TextAlign.left,
                                  style: Theme.of(context).textTheme.subtitle1),
                            ),
                            TableCell(
                              child: Text(
                                  '${decimalFormatter.format(year.titles[index].spectaculars)}',
                                  textAlign: TextAlign.left,
                                  style: Theme.of(context).textTheme.subtitle1),
                            ),
                          ]),
                          TableRow(children: [
                            TableCell(
                              child: Text(
                                  '\$ ${decimalFormatter.format(year.titles[index].boxOfficeUsd)}',
                                  textAlign: TextAlign.left,
                                  style: Theme.of(context).textTheme.subtitle1),
                            ),
                            TableCell(
                              child: Text(
                                  '${decimalFormatter.format(year.titles[index].screens)}',
                                  textAlign: TextAlign.left,
                                  style: Theme.of(context).textTheme.subtitle1),
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
