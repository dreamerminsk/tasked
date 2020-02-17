import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:kbapp/src/kb/kb.dart';
import 'package:kbapp/src/kb/model.dart';

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
                  .headline6,
            ),
            Text(
              '${this.movie.original}',
              style: Theme
                  .of(context)
                  .primaryTextTheme
                  .subtitle2,
            )
          ],
        ),
        actions: <Widget>[new Icon(Icons.more_vert)],
      ),
      body: Column(children: <Widget>[
        FutureBuilder<Movie>(
          future: kb.getMovie(this.movie.kbRef),
          builder: (BuildContext context, AsyncSnapshot<Movie> snapshot) {
            List<Widget> children;

            if (snapshot.hasData) {
              children = <Widget>[
                ListView(
                  shrinkWrap: true,
                  children: <Widget>[
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Image.network(snapshot.data.poster, width: 128),
                        Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[]),
                      ],
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: snapshot.data.genres
                          .map(
                            (g) =>
                            Chip(
                              label: AutoSizeText(
                                g,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                                softWrap: false,
                              ),
                            ),
                      )
                          .toList(),
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text(snapshot.data.description,
                            style: Theme
                                .of(context)
                                .textTheme
                                .subtitle2)
                      ],
                    ),
                  ],
                ),
              ];
            } else if (snapshot.hasError) {
              children = <Widget>[
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.red, width: 3)),
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
              ];
            }
            return SingleChildScrollView(
                child: Padding(
                    padding: EdgeInsets.all(4),
                    child: Column(
                      children: children,
                    )));
          },
        ),
      ]),
    );
  }
}
