import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'event_controller.dart';
import 'widgets/seasons_widget.dart';
import '../../routes/app_pages.dart';
//import '../../tasklist/task/task_item.dart';

class EventView extends StatelessWidget {
  const EventView({
    super.key,
  });

  @override
  Widget build(context) {
    final EventController c = Get.find();

    return Scaffold(
      appBar: AppBar(
          title: Obx(() => Text("${c.task.value?.title}")),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.query_stats),
              color: Theme.of(context).colorScheme.primary,
              onPressed: () {
                Get.toNamed(Routes.DEBUG);
              },
            ),
          ]),
      body: AnimatedSwitcher(
        duration: Duration(
          seconds: 2,
        ),
        child: Obx(
          () => c.isRunning.value
              ? SeasonsWidget()
              : Center(
                  child: IconButton.filled(
                    iconSize: 320,
                    icon: const Icon(Icons.blur_on),
                    onPressed: () {
                      c.start();
                    },
                  ),
                ), // Center
        ), // Obx
      ), // AnimatedSwitcher
    );
  }
}
