import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RequestedPath extends StatelessWidget {
  final String name;
  final Future<Directory?> request;

  const RequestedPath({
    super.key,
    required this.name,
    required this.request,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return FutureBuilder<Directory?>(
      future: request,
      builder: (context, snapshot) {
        final isDone = snapshot.connectionState == ConnectionState.done;
        final hasError = isDone && snapshot.hasError;
        final hasData = isDone && snapshot.hasData && snapshot.data != null;

        final color = hasError
            ? colorScheme.error
            : hasData
                ? colorScheme.primary
                : isDone
                    ? colorScheme.primaryContainer
                    : colorScheme.surfaceVariant;

        final onColor = hasError
            ? colorScheme.onError
            : hasData
                ? colorScheme.onPrimary
                : isDone
                    ? colorScheme.onPrimaryContainer
                    : colorScheme.onSurfaceVariant;

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
                  child: Text(snapshot.error!.runtimeType.toString()),
                  style: textTheme.bodyLarge!.copyWith(color: onColor),
                  duration: const Duration(seconds: 4),
                ),
              if (hasData)
                AnimatedDefaultTextStyle(
                  child: Text(snapshot.data!.path.split('/').last),
                  style: textTheme.bodyLarge!.copyWith(color: onColor),
                  duration: const Duration(seconds: 4),
                ),
            ],
          ),
        );
      },
    );
  }
}
