import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class DebugView extends StatelessWidget {

  @override
  Widget build(context) {
    final HomeController c = Get.find();

    return Scaffold(
      appBar: AppBar(title: Obx(() => Text("Anime: ${c.animeList.length}")),
              actions: <Widget>[IconButton(icon: Icon(Icons.copy), onPressed: (){},)]),

      body: Obx( () =>
      const Center(child: Text('No items'))),
      floatingActionButton:
          FloatingActionButton(child: Icon(Icons.refresh), onPressed: c.refresh));
  }
}
