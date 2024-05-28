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
      body: Obx(
        () => AnimatedSwitcher(
          duration: Duration(milliseconds: 1600),
          transitionBuilder: (Widget child, Animation<double> animation) {
            return SlideTransition(
position: Tween(
                begin: Offset(1.0, 1.0),
                end: Offset(0.0, 0.0),
              ).animate(animation),
//opacity: animation, 
child: child
);
          },
          child: c.isRunning.value
              ? SeasonsWidget(key: UniqueKey())
              : Center(
                  key: UniqueKey(),
                  child: IconButton.filled(
                    iconSize: 320,
                    icon: const Icon(Icons.blur_on),
                    onPressed: () {
                      c.start();
                    },
                  ),
                ), // Center
        ), // AnimatedSwitcher
      ), // Obx
    );
  }
}
