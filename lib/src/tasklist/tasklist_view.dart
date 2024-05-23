import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'tasklist_controller.dart';
import 'widgets/task_widget.dart';
import '../routes/app_pages.dart';

class TasklistView extends StatelessWidget {
  final colors = [
    Colors.black,
  ];

  @override
  Widget build(context) {
    final TasklistController c = Get.find();
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

      body: Obx(
        () => c.tasks.length > 0
            ? ListView.builder(
                itemCount: c.tasks.length,
                itemBuilder: (BuildContext context, int index) {
                  return _buildPadding(c.tasks[index]);
                },
              )
            : Center(
                child: Icon(Icons.tips_and_updates,
                    color: Theme.of(context).colorScheme.primary, size: 320.0)),
      ),
    );
  }

  Widget _buildPadding(BuildContext context, int index) {
    return index.isEven
? Padding(
            padding: EdgeInsets.fromLTRB(32, 8, 8, 8),
            child: TaskWidget(task: c.tasks[index],),
          ) // Padding
: Padding(
            padding: EdgeInsets.fromLTRB(8, 8, 32, 8),
            child: TaskWidget(task: c.tasks[index],),
          ); // Padding
  }
}
