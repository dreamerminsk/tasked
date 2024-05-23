import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'task_item.dart';
import '../../routes/app_pages.dart';

class TaskWidget extends StatelessWidget {
  const TaskWidget({
    super.key,
    required this.task,
    this.padding,
  });

  final TaskItem task;

  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return GestureDetector(
      onTap: () {
        Get.toNamed(
          Routes.TASK,
          arguments: this.task,
        );
      },
      child: Container(
        width: Get.width,
        height: Get.width / 2.0 / 1.618,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '${this.task.title}',
              style: textTheme.headlineLarge!.copyWith(
                color: colorScheme.onPrimary,
                fontWeight: FontWeight.w400,
              ),
            ), // Text
          ],
        ), // Column
        padding: this.padding ?? const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(20),
          ), // BorderRadius
          color: colorScheme.primary,
        ), // BoxDecoration
      ), // Container
    ); // GestureDetector
  }
}
