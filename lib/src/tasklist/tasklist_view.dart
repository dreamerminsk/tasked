import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'tasklist_controller.dart';
import '../routes/app_pages.dart';
import 'task/task_item.dart';
import 'task/task_widget.dart';

class TasklistView extends StatelessWidget {

  @override
  Widget build(context) {
    final TasklistController c = Get.find();

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
                  return _buildPadding(context, index, c.tasks[index]);
                },
              )
            : Center(
                child: Icon(Icons.tips_and_updates,
                    color: Theme.of(context).colorScheme.primary, size: 320.0)),
      ),
    );
  }

  Widget _buildPadding(BuildContext context, int index, TaskItem t) {
    return index.isEven
        ? Padding(
            padding: EdgeInsets.fromLTRB(32, 12, 12, 12),
            child: TaskWidget(
              task: t,
            ),
          ) // Padding
        : Padding(
            padding: EdgeInsets.fromLTRB(12, 12, 32, 12),
            child: TaskWidget(
              task: t,
            ),
          ); // Padding
  }
}
