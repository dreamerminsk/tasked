import 'package:async/async.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/cats_controller.dart';
import '../wiki/category_info.dart';
import 'debug_view.dart';
import 'home_view.dart';

class CatsView extends StatelessWidget {

  @override
  Widget build(context) {
    final CatsController c = Get.put(CatsController());

    return Scaffold(
      appBar: AppBar(title: Text("WikiCats"),
              actions: <Widget>[
                IconButton(icon: Icon(Icons.home), onPressed: () { Get.to(HomeView()); },),
                IconButton(icon: Icon(Icons.query_stats), onPressed: () { Get.to(DebugView()); },),
              ]),

      body: Obx( () =>
                c.categories.length > 0
                ? ListView.builder(
                  itemCount: c.categories.length,
                  itemBuilder: (BuildContext context, int index) {
                    return _catOrErrorCard(c.categories[index]);
                  },
                )
                : const Center(child: Text('No items'))
               ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: _buttons(c),
    );
  }

  Widget _catOrErrorCard(Result<CategoryInfo> result) {
    swith (result) {
      case ErrorResult e:
        return _errorCard(e.error);
      case ValueResult v:
        return _catCard(v.value);
      default:
        return Text('very strange');
    }
  }

  Widget _errorCard(Object e) {
    return InkWell(
      onTap: () { },
      child: Card(
        child: ListTile(
          leading: Icon(Icons.error, color: Colors.red, size: 64.0),
          title: Text('${e}'),
          subtitle: Text('...')
        ),
      ),
    );
  }

  Widget _catCard(CategoryInfo cat) {
    return InkWell(
      onTap: () { },
      child: Card(
        child: ListTile(
          leading: Icon(Icons.tips_and_updates, size: 64.0),
          title: Text('${cat.title ?? "<~~~>"}'),
          subtitle: Text('${cat.pages} pages, ${cat.subcats} categories')
        ),
      ),
    );
  }

  Widget _buttons(CatsController c) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            FloatingActionButton(
              heroTag: null,
              onPressed: () { c.before(); },
              child: Icon(Icons.navigate_before),
            ),
            FloatingActionButton(
              heroTag: null,
              onPressed: () { c.after(); },
              child: Icon(Icons.navigate_next),
            )
          ],
        ),
      );
  }//_buttons
}
