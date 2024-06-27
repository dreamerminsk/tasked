import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RequestedPaths extends StatelessWidget {
  const RequestedPaths({
    super.key,
    required this.name,
    required this.request,
  });

  final String name;
  final Future<List<Directory>?> request;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return FutureBuilder<List<Directory>?>(
      future: request,
      builder: (context, snapshot) {
        final isDone = snapshot.connectionState == ConnectionState.done;
        final hasError = isDone && snapshot.hasError;
        final hasData = isDone &&
            snapshot.hasData &&
            snapshot.data != null &&
            snapshot.data!.isNotEmpty;

        final color = hasError
            ? colorScheme.errorContainer
            : hasData
                ? colorScheme.primaryFixed
                : isDone
                    ? colorScheme.secondaryFixed
                    : colorScheme.surfaceDim;

        final onColor = hasError
            ? colorScheme.onErrorContainer
            : hasData
                ? colorScheme.onPrimaryFixed
                : isDone
                    ? colorScheme.onSecondaryFixed
                    : colorScheme.onSurface;

        return AnimatedContainer(
          width: Get.width - 16.0,
          height: (Get.width - 16.0) / 1.618 / 2.0,
          duration: const Duration(seconds: 4),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: color,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedDefaultTextStyle(
                child: Text(name),
                style: textTheme.headlineSmall!.copyWith(color: onColor),
                duration: const Duration(seconds: 4),
              ),
              if (hasError)
                AnimatedDefaultTextStyle(
                  child: Text(snapshot.error!.runtimeType.toString()), // Text
                  style: textTheme.bodyLarge!.copyWith(color: onColor),
                  duration: const Duration(seconds: 4),
                ), // AnimatedDefaultTextStyle
              if (hasData)
                AnimatedDefaultTextStyle(
                  child: Text(_toShortString(snapshot.data!)), // Text
                  style: textTheme.titleLarge!.copyWith(color: onColor),
                  duration: const Duration(seconds: 4),
                ), // AnimatedDefaultTextStyle
            ],
          ), // Column
        ); // AnimatedContainer
      },
    );
  }

  String _toShortString(List<Directory> list) {
    if (list.isEmpty) return '';
    return list.first.path.split('/').last + (list.length > 1 ? ',' : '');
  }
}
