import 'package:async/async.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'watchlist_controller.dart';
import '../wiki/entities/category_info.dart';
import '../routes/app_pages.dart';

class WatchlistView extends StatelessWidget {
  final colors = [
    Colors.black,
  ];

  @override
  Widget build(context) {
    final WatchlistController c = Get.find();
    this.colors[0] = Theme.of(context).colorScheme.primary;

    return Scaffold(
      appBar: AppBar(title: Text("Watchlist"), actions: <Widget>[
        IconButton(
          icon: Icon(Icons.home),
          color: Theme.of(context).colorScheme.primary,
          onPressed: () {
            Get.toNamed(Routes.HOME);
          },
        ),
        IconButton(
          icon: Icon(Icons.casino),
          color: Theme.of(context).colorScheme.primary,
          onPressed: () {
            Get.toNamed(Routes.TASKLIST);
          },
        ),
        IconButton(
          icon: Icon(Icons.query_stats),
          color: Theme.of(context).colorScheme.primary,
          onPressed: () {
            Get.toNamed(Routes.DEBUG);
          },
        ),
      ]),

      body: Obx(
        () => c.categories.length > 0
            ? ListView.builder(
                itemCount: c.categories.length,
                itemBuilder: (BuildContext context, int index) {
                  return _catOrErrorCard(c.categories[index]);
                },
              )
            : Center(
                child: Icon(Icons.tips_and_updates,
                    color: Theme.of(context).colorScheme.primary, size: 160.0)),
      ),
      //floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      //floatingActionButton: _buttons(c),
    );
  }

  Widget _catOrErrorCard(Result<CategoryInfo> result) {
    switch (result) {
      case ErrorResult e:
        return _errorCard(e.error, e.stackTrace);
      case ValueResult v:
        return _catCard(v.value);
      default:
        return Text('very strange');
    }
  }

  Widget _errorCard(Object e, StackTrace s) {
    return InkWell(
      onTap: () {},
      child: Card(
        child: ListTile(
            leading: Icon(Icons.error, color: Colors.red, size: 64.0),
            title: Text('$e'),
            subtitle: Text('$s')),
      ),
    );
  }

  Widget _catCard(CategoryInfo cat) {
    return InkWell(
      onTap: () {
        Get.toNamed(Routes.CATEGORY, arguments: cat);
      },
      child: Card(
        child: ListTile(
            leading:
                Icon(Icons.tips_and_updates, color: this.colors[0], size: 64.0),
            title: Text('${cat.title}'),
            subtitle: Text(
                '${cat.subcats} subcats, ${cat.pages} pages, ∞ cats, ∞ langs')),
      ),
    );
  }

  //Widget _buttons(WatchlistController c) {
  //return Padding(
  //padding: const EdgeInsets.all(8.0),
  //child: Row(
  //mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //children: <Widget>[
  // FloatingActionButton(
  //heroTag: null,
  //onPressed: () { c.before(); },
  //child: Icon(Icons.navigate_before),
  //),
  //FloatingActionButton(
  //heroTag: null,
  //onPressed: () { c.after(); },
  //child: Icon(Icons.navigate_next),
  //)
  //],
  //),
  //);
  //}//_buttons
}
