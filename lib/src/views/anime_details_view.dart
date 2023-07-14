import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class AnimeDetailsView extends StatelessWidget {

  @override
  Widget build(context) {
    final HomeController c = Get.find();

    return Scaffold(
      appBar: AppBar(title: () => Text("AnimeDetails"),
              actions: <Widget>[
                IconButton(icon: Icon(Icons.settings), onPressed: () { },),
                IconButton(icon: Icon(Icons.copy), onPressed: () { },),
              ]),

      body: 
      Obx(()=>
        Column(
          children: <Widget>[
            Card(
              child: CachedNetworkImage(
                    imageUrl: (c.selected.value.wiki?.image ?? '').replaceFirst('220px','512px'),
                    placeholder: (context, url) => CircularProgressIndicator(),
                    errorWidget: (context, url, error) => Icon(size: 128.0, Icons.error),
                    imageBuilder: (context, image) => Container(
                      width: 512,
                      height: 512,
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
            ), //Card
            Expanded(
              child: Text(c.selected.value.title ?? '<~~~~~>'),
            ), //Expanded
          ],
        )), //Row
      floatingActionButton:
          FloatingActionButton(child: Icon(Icons.refresh), onPressed: c.refresh));
  }
}
