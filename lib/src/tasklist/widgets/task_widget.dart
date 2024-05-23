import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/task.dart';

class TaskWidget extends StatelessWidget {
  final Task task;
  const TaskWidget({
    super.key,
    required this.task,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Material(
    ); // Material
  }
}
