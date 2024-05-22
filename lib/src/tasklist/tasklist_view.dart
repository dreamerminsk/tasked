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
            child: _buildTask(context, 'task 1'),
          ), // Padding
          Padding(
            padding: EdgeInsets.fromLTRB(4, 4, 20, 4),
            child: _buildTask(context, 'task 2'),
          ), // Padding
          Padding(
            padding: EdgeInsets.fromLTRB(20, 4, 4, 4),
            child: _buildTask(context, 'task 3'),
          ), // Padding
          Padding(
            padding: EdgeInsets.fromLTRB(4, 4, 20, 4),
            child: _buildTask(context, 'task 4'),
          ), // Padding
        ],
      ), // ListView
    );
  }

  Widget _buildTask(BuildContext context, String title) {
    return Container(
          width: Get.width,
          height: 96,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                '$title',
                style: Theme.of(context).textTheme.headlineSmall!
                    .copyWith(color: Theme.of(context).colorScheme.onPrimary),
              ), // Text
            ],
          ), // Column
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ), // BorderRadius
            color: Theme.of.(context).colorScheme.primary,
          ), // BoxDecoration
        ); //Container
  }
}
