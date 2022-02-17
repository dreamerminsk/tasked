import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:kb_dart/src/kb/kb.dart';
import 'package:kb_dart/src/kb/model.dart';

class MovieModel with ChangeNotifier {}

class MoviePage extends StatelessWidget {
  final Movie movie;

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
      body: FutureBuilder<Movie>(
        future: kb.getMovie(this.movie.kbRef),
        builder: (BuildContext context, AsyncSnapshot<Movie> snapshot) {
          Widget children;
          if (snapshot.hasData) {
            children = ListView(
              padding: EdgeInsets.symmetric(horizontal: 4.0),
              shrinkWrap: true,
              children: <Widget>[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Image.network(snapshot.data?.poster ?? "", width: 128),
                    Column(
                        mainAxisSize: MainAxisSize.min, children: <Widget>[]),
                  ],
                ),
                Wrap(
                  spacing: 4.0,
                  children: snapshot.data?.genres
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
                      .toList() as List<Widget>,
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text(snapshot.data?.description ?? "...",
                        style: Theme
                            .of(context)
                            .textTheme
                            .subtitle2)
                  ],
                ),
                Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(height: 8.0),
                      Text('Кассовые сборы в России и СНГ:',
                          textAlign: TextAlign.start,
                          style: TextStyle(fontSize: 18)),
                    ]),
                Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(height: 8.0),
                      Text('Касса мирового проката:',
                          textAlign: TextAlign.start,
                          style: TextStyle(fontSize: 18)),
                    ]),
              ],
            );
          } else if (snapshot.hasError) {
            children = Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.red, width: 3)),
              padding: const EdgeInsets.only(top: 16),
              child: Text('Error: ${snapshot.error}'),
            );
          } else {
            children = SizedBox(
              child: CircularProgressIndicator(),
              width: 60,
              height: 60,
            );
          }
          return children;
        },
      ),
    );
  }
}
