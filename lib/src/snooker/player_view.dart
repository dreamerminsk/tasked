import 'package:flutter/material.dart';
import 'package:get/get.dart';

//import 'task_controller.dart';
import '../routes/app_pages.dart';
import '../tasklist/task/task_item.dart';

class PlayerView extends StatelessWidget {
  const PlayerView({
    super.key,
  });

  @override
  Widget build(context) {
    final TaskItem task = Get.arguments;

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
      body: Center(
        child: IconButton.filled(
          iconSize: 320,
          icon: const Icon(Icons.blur_on),
          onPressed: () {},
        ),
      ), // Center
    );
  }
}
