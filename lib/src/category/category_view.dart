import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_indicator/loading_indicator.dart';

import '../controllers/category_controller.dart';

class AnimeDetailsView extends StatelessWidget {

  @override
  Widget build(context) {
    final CategoryController c = Get.find();

    return Scaffold(
      body: 
      Obx(()=>
        Stack(
          children: <Widget>[
            Positioned(
              top: 20.0,
              left: 50.0,
              child: Expanded(
                child: Text(
                  'Category:*',
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
              ), //Expanded
            ),
          ],
        )), //Stack
      floatingActionButton:
          FloatingActionButton(child: Icon(Icons.refresh), onPressed: c.refresh));
  }
}
