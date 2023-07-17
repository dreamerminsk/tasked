import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../controllers/home_controller.dart';
import 'debug_view.dart';
import 'cats_view.dart';
import 'anime_details_view.dart';

class HomeView extends StatelessWidget {

  @override
  Widget build(context) {
    final HomeController c = Get.put(HomeController());

    return Scaffold(
      appBar: AppBar(title: Obx(() => Text("Bookmarks [t:${c.timers}, r:${c.requests}]")),
              actions: <Widget>[
                IconButton(icon: Icon(Icons.app_shortcut), onPressed: () { Get.to(CatsView()); },),
                IconButton(icon: Icon(Icons.account_balance), onPressed: () { Get.to(DebugView()); },),
                IconButton(icon: Icon(Icons.query_stats), onPressed: () { Get.to(DebugView()); },),
              ]),

      body: Obx( () =>
      c.animeList.length > 0
      ? ListView.builder(
          itemCount: c.animeList.length,
          itemBuilder: (BuildContext context, int index) {
            return InkWell(onTap: () { c.select(index); Get.to(AnimeDetailsView());},
             child: Card(
              child: ListTile(
                leading: c.animeList[index].wiki?.image != null
                  ? CachedNetworkImage(
                    imageUrl: (c.animeList[index].wiki?.image ?? '').replaceFirst('220px', '96px'),
                    placeholder: (context, url) => CircularProgressIndicator(),
                    errorWidget: (context, url, error) => Icon(Icons.error, color: Colors.red, size: 96.0),
                    imageBuilder: (context, image) => Container(
                      width: 96.00,
                      height: 150.00,
                      decoration: new BoxDecoration(
                        image: new DecorationImage(
                          image: image,
                          fit: BoxFit.contain,
                        ),
                      ))
                  )
                  : Icon(Icons.image_not_supported, color: Colors.gray, size: 64.0),
                title: Text('${c.animeList[index].title}'),
                subtitle: Text('${c.animeList[index].wiki?.mviMonth ?? 0} - ${DateFormat("HH:mm:ss.SSS").format(c.animeList[index].wiki?.lastUpdate ?? DateTime(2000))}'),
            ),));
          },
        )
      : const Center(child: Text('No items'))),
      floatingActionButton:
          FloatingActionButton(child: Icon(Icons.refresh), onPressed: c.refresh));
  }
}
