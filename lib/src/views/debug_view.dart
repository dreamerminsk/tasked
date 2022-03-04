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

      body: Obx( () => {
        final encoder = JsonEncoder.withIndent('   ');
        return const Center(child: Text('${encoder.convert(c.animeList)}'));
      }),
      floatingActionButton:
          FloatingActionButton(child: Icon(Icons.refresh), onPressed: c.refresh));
  }
}
