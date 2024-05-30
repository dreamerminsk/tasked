import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'event_controller.dart';
import 'widgets/seasons_widget.dart';
import '../../routes/app_pages.dart';

class EventView extends StatelessWidget {
  const EventView({
    super.key,
  });

  @override
  Widget build(context) {
    final EventController c = Get.find();

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
      body: Obx(
        () => AnimatedSwitcher(
          duration: Duration(milliseconds: 320),
          transitionBuilder: (Widget child, Animation<double> animation) {
            return FadeScaleTransition(
                animation: animation,
                //position: Tween(
                //begin: Offset(1.0, 0.0),
                //end: Offset(0.0, 0.0),
                //).animate(animation),
                //opacity: animation,
                child: child);
          },
          child: c.isRunning.value
              ? SeasonsWidget(key: UniqueKey())
              : Center(
                  key: UniqueKey(),
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
