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

    final double adjustedWidth = Get.width - 2 * 8;

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
          style: const ButtonStyle(
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
          constraints: BoxConstraints(
            maxWidth: adjustedWidth,
            minWidth: adjustedWidth,
            maxHeight: adjustedWidth,
            minHeight: adjustedWidth,
          ),
          iconSize: adjustedWidth,
          icon: const Icon(Icons.blur_on),
          onPressed: () {},
        ), // IconButton
      ), // Center
    );
  }
}
