import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/cats_controller.dart';
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
                    return InkWell(
                      onTap: () { },
                      child: Card(
                        child: ListTile(
                          leading: Icon(Icons.tips_and_updates, size: 64.0),
                          title: Text('${c.categories[index].title ?? "<~~~>"}'),
                          subtitle: Text('...')
                        ),
                      )
                    );
                  },
                )
                : const Center(child: Text('No items'))
               ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: _buttons(c),
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
