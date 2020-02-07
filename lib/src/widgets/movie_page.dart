import 'package:flutter/material.dart';
import 'package:kbapp/src/kb/model.dart';

class MovieModel with ChangeNotifier {}

class MoviePage extends StatelessWidget {
  final YearRecord _movie;

  MoviePage(this._movie);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('${this._movie}'),
        ),
        body: Center(
          child: Column(children: <Widget>[
            Text('${this._movie.title}'),
            Text('${this._movie.original}'),
          ]),
        ));
  }
}
