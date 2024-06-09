import 'package:flutter/material.dart';
import 'package:get/get.dart';


class DebugIconButton extends StatelessWidget {
  const DebugIconButton({
    super.key,
    this.color,
   required this.route,
  });

  final Color? color;
final String route;

  @override
  Widget build(BuildContext context) {
final colorScheme = Theme.of(context).colorScheme;

    return IconButton(
          icon: const Icon(Icons.query_stats),
          color: color ?? colorScheme.primary,
          onPressed: () {
            Get.toNamed(route);
          }, // onPressed
        ), // IconButton
  }
}