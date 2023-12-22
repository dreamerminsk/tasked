import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class AnimeDetailsView extends StatelessWidget {

  @override
  Widget build(context) {
    final HomeController c = Get.find();

    return Scaffold(
      body: 
      Obx(()=>
        Stack(
          children: <Widget>[
            CachedNetworkImage(
                    imageUrl: (c.selected.value.wiki?.image ?? '').replaceFirst('220px','512px'),
                    placeholder: (context, url) => CircularProgressIndicator(),
                    errorWidget: (context, url, error) => Icon(Icons.error, size: 512.0),
                    imageBuilder: (context, image) => Container(
                      width: 512,
                      height: 512,
                      decoration: new BoxDecoration(
                        image: new DecorationImage(
                          image: image,
                          fit: BoxFit.cover,
                        ),
                        border: Border.all(
                          color: Colors.black,
                          width: 1,
                        ),
                      ))
                  ), //CachedNetworkImage
            Expanded(
              child: Text(
                c.selected.value.title ?? '<~~~~~>',
                style: Theme.of(context).textTheme.headlineLarge,
              ),
            ), //Expanded
          ],
        )), //Row
      floatingActionButton:
          FloatingActionButton(child: Icon(Icons.refresh), onPressed: c.refresh));
  }
}
