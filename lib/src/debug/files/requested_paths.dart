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
          duration: const Duration(milliseconds: 500),
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
                duration: const Duration(milliseconds: 500),
              ),
              AnimatedScale(
                child: Text(
                  hasData
                      ? _toShortString(snapshot.data!)
                      : (hasError
                          ? snapshot.error!.runtimeType.toString()
                          : ''),
                  style: textTheme.titleLarge!.copyWith(
                    color: onColor,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                scale: (hasData || hasError) ? 1.0 : 0.1,
                duration: const Duration(milliseconds: 500),
              ),
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
