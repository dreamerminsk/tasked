import 'package:flutter/material.dart';
import 'package:get/get.dart';

//import 'task_controller.dart';
import '../../routes/app_pages.dart';
import 'task_item.dart';
import '../../core/widgets/icon_buttons.dart';

class TaskView extends StatelessWidget {
  const TaskView({
    super.key,
  });

  @override
  Widget build(context) {
    final TaskItem task = Get.arguments;

    return Scaffold(
      appBar: AppBar(title: Text("${task.title}"), actions: <Widget>[
        DebugIconButton(
          route: Routes.DEBUG,
        ), // DebugIconButton
      ]),
      body: Center(
        child: Icon(Icons.blur_on,
            color: Theme.of(context).colorScheme.primary, size: 320.0), // Icon
      ), // Center
    );
  }
}
