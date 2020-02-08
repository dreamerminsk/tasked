import 'package:flutter/material.dart';
import 'package:kbapp/src/kb/model.dart';

class MovieModel with ChangeNotifier {}

class MoviePage extends StatelessWidget {
  final YearRecord movie;

  MoviePage(this.movie);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('${this.movie.title}'),
        ),
        body: Center(
          child: Column(children: <Widget>[
            Text('${this.movie.title}'),
            Text('${this.movie.original}'),
            Text('${this.movie.distributor}'),
            Text('${this.movie.boxOffice} / ${this.movie.spectaculars}'),
          ]),
        ));
  }
}
