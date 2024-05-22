import 'package:flutter/material.dart';
import 'package:get/get.dart';

//import 'tasklist_controller.dart';
import '../routes/app_pages.dart';

class TasklistView extends StatelessWidget {
  final colors = [
    Colors.black,
  ];

  @override
  Widget build(context) {
    //final TasklistController c = Get.find();
    this.colors[0] = Theme.of(context).colorScheme.primary;

    return Scaffold(
      appBar: AppBar(title: Text("tasklist"), actions: <Widget>[
        IconButton(
          icon: Icon(Icons.home),
          color: Theme.of(context).colorScheme.primary,
          onPressed: () {
            Get.toNamed(Routes.HOME);
          },
        ),
        IconButton(
          icon: Icon(Icons.query_stats),
          color: Theme.of(context).colorScheme.primary,
          onPressed: () {
            Get.toNamed(Routes.DEBUG);
          },
        ),
      ]),

      body: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(20, 4, 4, 4),
            child: Files(),
          ), // Padding
          Padding(
            padding: EdgeInsets.fromLTRB(4, 4, 20, 4),
            child: ColorSchemeWidget(),
          ), // Padding
          Padding(
            padding: EdgeInsets.fromLTRB(20, 4, 4, 4),
            child: TextThemeWidget(),
          ), // Padding
          Padding(
            padding: EdgeInsets.fromLTRB(4, 4, 20, 4),
            child: ScannerWidget(),
          ), // Padding
        ],
      ), // ListView
    );
  }
}
