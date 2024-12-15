import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum IconButtonVariant { standard, filled, filledTonal, outlined }

class DebugIconButton extends StatelessWidget {
  const DebugIconButton({
    super.key,
    this.color,
    required this.route,
  }) : _variant = IconButtonVariant.standard;

  const DebugIconButton.filled({
    super.key,
    this.color,
    required this.route,
  }) : _variant = IconButtonVariant.filled;

  const DebugIconButton.filledTonal({
    super.key,
    this.color,
    required this.route,
  }) : _variant = IconButtonVariant.filledTonal;

  const DebugIconButton.outlined({
    super.key,
    this.color,
    required this.route,
  }) : _variant = IconButtonVariant.outlined;

  final Color? color;
  final String route;
  final IconButtonVariant _variant;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return switch (_variant) {
      IconButtonVariant.filled => IconButton.filled(
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
      IconButtonVariant.outlined => IconButton.outlined(
          icon: const Icon(Icons.query_stats),
          color: color ?? colorScheme.primary,
          onPressed: () {
            Get.toNamed(route);
          }, // onPressed
        ), // IconButton
      IconButtonVariant.standard => IconButton(
          icon: const Icon(Icons.query_stats),
          color: color ?? colorScheme.primary,
          onPressed: () {
            Get.toNamed(route);
          }, // onPressed
        ), // IconButton
    };
  }
}




class RandomThemeButton extends StatelessWidget {
  const RandomThemeButton({
    super.key,
    this.color,
    required this.route,
  }) : _variant = IconButtonVariant.standard;

  const RandomThemeButton.filled({
    super.key,
    this.color,
    required this.route,
  }) : _variant = IconButtonVariant.filled;

  const RandomThemeButton.filledTonal({
    super.key,
    this.color,
    required this.route,
  }) : _variant = IconButtonVariant.filledTonal;

  const RandomThemeButton.outlined({
    super.key,
    this.color,
    required this.route,
  }) : _variant = IconButtonVariant.outlined;

  final Color? color;
  final String route;
  final IconButtonVariant _variant;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return switch (_variant) {
      IconButtonVariant.filled => IconButton.filled(
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
      IconButtonVariant.outlined => IconButton.outlined(
          icon: const Icon(Icons.query_stats),
          color: color ?? colorScheme.primary,
          onPressed: () {
            Get.toNamed(route);
          }, // onPressed
        ), // IconButton
      IconButtonVariant.standard => IconButton(
          icon: const Icon(Icons.query_stats),
          color: color ?? colorScheme.primary,
          onPressed: () {
            Get.toNamed(route);
          }, // onPressed
        ), // IconButton
    };
  }
}
