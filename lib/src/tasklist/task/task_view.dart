import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'task_controller.dart';
import '../../routes/app_pages.dart';
import '../models/task.dart';

class TaskView extends StatelessWidget {

  @override
  Widget build(context) {
    final TaskController c = Get.find();

    return Scaffold(
      appBar: AppBar(title: Text("task"), actions: <Widget>[
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

}
