import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_indicator/loading_indicator.dart';

import 'home_controller.dart';

class HomeDetailsView extends StatelessWidget {

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
              placeholder: (context, url) => LoadingIndicator(indicatorType: Indicator.ballGridPulse),
              errorWidget: (context, url, error) => Icon(Icons.error, size: 512.0, color: Colors.red,),
              imageBuilder: (context, image) => Container(
                      width: Get.width,
                      //height: 512,
                      alignment: Alignment.topLeft,
                      decoration: new BoxDecoration(
                        image: new DecorationImage(
                          image: image,
                          fit: BoxFit.fitWidth,
                        ),
                        borderRadius: BorderRadius.vertical(
                      bottom: Radius.circular(40),
                    ),
                      ))
                  ), //CachedNetworkImage
            Positioned(
              top: 200.0,
              left: 0.0,
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Text(
                      c.selected.value.title ?? '<~~~~~>',
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                  ), //Expanded
              ]),
            ),
          ],
        )), //Stack
      floatingActionButton:
          FloatingActionButton(child: Icon(Icons.refresh), onPressed: c.refresh));
  }
}
