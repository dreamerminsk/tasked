import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends StatelessWidget {

  @override
  Widget build(context) {
    final HomeController c = Get.put(HomeController());

    return Scaffold(
      appBar: AppBar(title: Obx(() => Text("Anime: ${c.animeList.length}")),
              actions: <Widget>[IconButton(icon: Icon(Icons.copy))]),

      body: Obx( () =>
      c.animeList.length > 0
      ? ListView.builder(
          itemCount: c.animeList.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              child: ListTile(
                leading: c.animeList[index].wikiImage != null
                  ? Image.network(c.animeList[index].wikiImage, width: 56)
                  : FlutterLogo(size: 56.0),
                title: Text('${c.animeList[index].title}'),
                subtitle: Text('${c.animeList[index].mviMonth} - ${c.animeList[index].wikiTitle}'),
            ),);
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
