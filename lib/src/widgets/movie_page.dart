import 'package:flutter/material.dart';
import 'package:kbapp/src/kb/kb.dart';
import 'package:kbapp/src/kb/model.dart';

import '../utils/formatters.dart';

class MovieModel with ChangeNotifier {}

class MoviePage extends StatelessWidget {
  final YearRecord movie;

  MoviePage(this.movie);

  @override
  Widget build(BuildContext context) {
    final kb = KbApi();
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
              '${this.movie.distributor} ${this.movie.kbRef}',
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
            FutureBuilder<Movie>(
              future: kb.getMovie(this.movie.kbRef),
              builder: (BuildContext context, AsyncSnapshot<Movie> snapshot) {
                List<Widget> children;

                if (snapshot.hasData) {
                  children = <Widget>[
                    Icon(
                      Icons.check_circle_outline,
                      color: Colors.green,
                      size: 60,
                    ),
                    Image.network(snapshot.data.poster, width: 256),
                    Padding(
                      padding: const EdgeInsets.only(top: 16),
                      child: Text('Result: ${snapshot.data.kbRef}'),
                    )
                  ];
                } else if (snapshot.hasError) {
                  children = <Widget>[
                    Icon(
                      Icons.error_outline,
                      color: Colors.red,
                      size: 60,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 16),
                      child: Text('Error: ${snapshot.error}'),
                    )
                  ];
                } else {
                  children = <Widget>[
                    SizedBox(
                      child: CircularProgressIndicator(),
                      width: 60,
                      height: 60,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 16),
                      child: Text('Awaiting result...'),
                    ),
                  ];
                }
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: children,
                  ),
                );
              },
            ),
          ]),
        ));
  }
}
