import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'task_controller.dart';
import '../../routes/app_pages.dart';
import '../models/task.dart';

class TaskView extends StatelessWidget {

  const TaskView({
    super.key,
  });

  @override
  Widget build(context) {
    final Task task = Get.arguments;

    return Scaffold(
      appBar: AppBar(title: Text("${task.title}"), actions: <Widget>[
        IconButton(
          icon: Icon(Icons.query_stats),
          color: Theme.of(context).colorScheme.primary,
          onPressed: () {
            Get.toNamed(Routes.DEBUG);
          },
        ),
      ]),
      body:
        Center(
          child: Icon(
            Icons.blur_on,
            color: Theme.of(context).colorScheme.primary,
            size: 320.0
          ), // Icon
), // Center
    );
  }

}
