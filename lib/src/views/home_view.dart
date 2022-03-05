import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';
import 'debug_view.dart';
import 'anime_details_view.dart';

class HomeView extends StatelessWidget {

  @override
  Widget build(context) {
    final HomeController c = Get.put(HomeController());

    return Scaffold(
      appBar: AppBar(title: Obx(() => Text("Anime: ${c.animeList.length}")),
              actions: <Widget>[
                IconButton(icon: Icon(Icons.settings), onPressed: () { Get.to(DebugView()); },),
                IconButton(icon: Icon(Icons.copy), onPressed: () {},),
              ]),

      body: Obx( () =>
      c.animeList.length > 0
      ? ListView.builder(
          itemCount: c.animeList.length,
          itemBuilder: (BuildContext context, int index) {
            return InkWell(onTap: () {Get.to(AnimeDetailsView(), arguments:  (c.animeList[index].title ?? ''));},
             child: Card(
              child: ListTile(
                leading: c.animeList[index].wiki?.image != null
                  ? CachedNetworkImage(
                    imageUrl: c.animeList[index].wiki?.image ?? '',
                    placeholder: (context, url) => CircularProgressIndicator(),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                    imageBuilder: (context, image) => Container(
                      width: 64.00,
                      height: 100.00,
                      decoration: new BoxDecoration(
                        image: new DecorationImage(
                          image: image,
                          fit: BoxFit.contain,
                        ),
                        border: Border.all(
                          color: Colors.black,
                          width: 1,
                        ),
                      ))
                  )
                  : FlutterLogo(size: 56.0),
                title: Text('${c.animeList[index].title}'),
                subtitle: Text('${c.animeList[index].wiki?.mviMonth ?? 0}'),
            ),));
          },
        )
      : const Center(child: Text('No items'))),
      floatingActionButton:
          FloatingActionButton(child: Icon(Icons.refresh), onPressed: c.refresh));
  }
}

class Other extends StatelessWidget {
  final HomeController c = Get.find();

  @override
  Widget build(context){
     return Scaffold(body: Center(child: Text("${c.count}")));
  }
}
