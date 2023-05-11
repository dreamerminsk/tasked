import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';
import '../models/anime.dart';

class AnimeDetailsView extends StatelessWidget {

  @override
  Widget build(context) {
    final HomeController c = Get.find();

    return Scaffold(
      appBar: AppBar(title: Obx(() => Text("Anime: ${c.animeList.length}")),
              actions: <Widget>[
                IconButton(icon: Icon(Icons.settings), onPressed: () { },),
                IconButton(icon: Icon(Icons.copy), onPressed: () { },),
              ]),

      body: 
        Row(
          children: <Widget>[
            Card(
              child: CachedNetworkImage(
                    imageUrl: c.selected.wiki?.image ?? '',
                    placeholder: (context, url) => CircularProgressIndicator(),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                    imageBuilder: (context, image) => Container(
                      width: double.infinity,
                      height: double.infinity,
                      decoration: new BoxDecoration(
                        image: new DecorationImage(
                          image: image,
                          fit: BoxFit.fill,
                        ),
                        border: Border.all(
                          color: Colors.black,
                          width: 1,
                        ),
                      ))
                  )
            ),
          ],
        ), //Row
      floatingActionButton:
          FloatingActionButton(child: Icon(Icons.refresh), onPressed: c.refresh));
  }
}
