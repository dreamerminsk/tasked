import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'tasklist_controller.dart';
import '../routes/app_pages.dart';
import 'task/task_item.dart';
import 'task/task_widget.dart';
import '../core/widgets/icon_buttons.dart';

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
        DebugIconButton(
          route: Routes.DEBUG,
        ), // DebugIconButton
      ]),
      body: Obx(
        () => c.tasks.length > 0
            ? ListView.builder(
                itemCount: c.tasks.length,
                itemBuilder: (BuildContext context, int index) {
                  return _buildPadding(index, c.tasks[index]);
                },
              ) // ListView.builder
            : Center(
                child: Icon(
                  Icons.tips_and_updates,
                  color: Theme.of(context).colorScheme.primary,
                  size: 320.0,
                ), // Icon
              ), // Center
      ), // Obx
    ); // Scaffold
  }

  Widget _buildPadding(int index, TaskItem t) {
    final m = index % 5;
    final leftPadding = 32.0 - 5 * m;
    final rightPadding = 12.0 + 5 * m;

    return TaskWidget(
      padding: EdgeInsets.fromLTRB(leftPadding, 8, rightPadding, 8),
      task: t,
    );
  }
}
