import 'package:flutter/material.dart';
import 'package:kbapp/src/kb/model.dart';

import '../utils/formatters.dart';

class MovieModel with ChangeNotifier {}

class MoviePage extends StatelessWidget {
  final YearRecord movie;

  MoviePage(this.movie);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${this.movie.title}',
                style: Theme
                    .of(context)
                    .primaryTextTheme
                    .title,
              ),
              Text(
                '${this.movie.original}',
                style: Theme
                    .of(context)
                    .primaryTextTheme
                    .subtitle,
              )
            ],
          ),
          actions: <Widget>[new Icon(Icons.more_vert)],
        ),
        body: Center(
          child: Column(children: <Widget>[
            Text(
              '${this.movie.distributor}',
              style: Theme
                  .of(context)
                  .textTheme
                  .display1,
            ),
            Text(
              '${decimalFormatter.format(
                  this.movie.boxOffice)} / ${decimalFormatter.format(
                  this.movie.spectaculars)}',
              style: Theme
                  .of(context)
                  .textTheme
                  .title,
            ),
          ]),
        ));
  }
}
