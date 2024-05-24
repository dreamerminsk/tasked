import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'event_controller.dart';
import '../routes/app_pages.dart';
//import '../tasklist/task/task_item.dart';

class EventView extends StatelessWidget {
  const EventView({
    super.key,
  });

  @override
  Widget build(context) {
    final EventController c = Get.find();

    return Scaffold(
      appBar: AppBar(
title: obx(() => Text("${c.task.value?.title}")), 
actions: <Widget>[
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
