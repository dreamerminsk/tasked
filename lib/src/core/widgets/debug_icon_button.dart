import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum IconButtonVariant { standard, filled, filledTonal, outlined }

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

    return switch (variant) {
      IconButtonVariant.filled      => IconButton.filled(
      icon: const Icon(Icons.query_stats),
      color: color ?? colorScheme.primary,
      onPressed: () {
        Get.toNamed(route);
      }, // onPressed
    ), // IconButton
      IconButtonVariant.filledTonal => IconButton.filledTonal(
      icon: const Icon(Icons.query_stats),
      color: color ?? colorScheme.primary,
      onPressed: () {
        Get.toNamed(route);
      }, // onPressed
    ), // IconButton
      IconButtonVariant.outlined    => IconButton.outlined(
      icon: const Icon(Icons.query_stats),
      color: color ?? colorScheme.primary,
      onPressed: () {
        Get.toNamed(route);
      }, // onPressed
    ), // IconButton
      IconButtonVariant.standard    => IconButton(
      icon: const Icon(Icons.query_stats),
      color: color ?? colorScheme.primary,
      onPressed: () {
        Get.toNamed(route);
      }, // onPressed
    ), // IconButton
    };
  }
}
