import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'player_controller.dart';
import '../../routes/app_pages.dart';
//import '../../tasklist/task/task_item.dart';

class PlayerView extends StatelessWidget {
  const PlayerView({
    super.key,
  });

final double paddingValue = 8.0;

  @override
  Widget build(context) {
    final PlayerController c = Get.find();

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
      body: Center(
        child: IconButton.outlined(
iconSize: Get.width - 2 * paddingValue,
          icon: const Icon(Icons.blur_on),
          onPressed: () {},
        ),
      ), // Center
    );
  }
}
