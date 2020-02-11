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
      body: Column(children: <Widget>[
        FutureBuilder<Movie>(
          future: kb.getMovie(this.movie.kbRef),
          builder: (BuildContext context, AsyncSnapshot<Movie> snapshot) {
            List<Widget> children;

            if (snapshot.hasData) {
              children = <Widget>[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Image.network(snapshot.data.poster, width: 128),
                    Flexible(
                      child: Row(
                        children: snapshot.data.genres
                            .map(
                              (g) =>
                              Flexible(
                                child: Text(g,
                                    style: Theme
                                        .of(context)
                                        .textTheme
                                        .body1),
                              ),
                        )
                            .toList(),
                      ),
                    )
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
            return Padding(
              padding: EdgeInsets.all(4.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: children,
              ),
            );
          },
        ),
      ]),
    );
  }
}
