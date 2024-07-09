import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'task_item.dart';

class TaskWidget extends StatelessWidget {
  const TaskWidget({
    super.key,
    required this.task,
  });

  final TaskItem task;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return GestureDetector(
      onTap: () {
        Get.toNamed(
          this.task.path,
          arguments: this.task,
        );
      },
      child: AspectRatio(
        aspectRatio: 3 * 1.618,
        child: Container(
          width: Get.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                '${this.task.title}',
                style: textTheme.headlineLarge!.copyWith(
                  color: colorScheme.onPrimary,
                  fontWeight: FontWeight.w300,
                ),
              ), // Text
            ],
          ), // Column
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(
              Radius.circular(20),
            ), // BorderRadius
            color: colorScheme.primary,
          ), // BoxDecoration
        ), // Container
      ), // AspectRatio
    ); // GestureDetector
  }
}
