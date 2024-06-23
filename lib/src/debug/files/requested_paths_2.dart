import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RequestedPaths2 extends StatelessWidget {
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

    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth - 2 * 16.0;
        final height = width / 1.618 / 2.0;

        return FutureBuilder<List<Directory>?>(
          future: request,
          builder: (context, snapshot) {
            Color color;
            Color onColor;
            int? itemCount;

            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasError) {
                color = colorScheme.error;
                onColor = colorScheme.onError;
              } else if (snapshot.hasData) {
                final data = snapshot.data;
                itemCount = data?.length;
                if (itemCount == 0) {
                  color = colorScheme.primaryContainer;
                  onColor = colorScheme.onPrimaryContainer;
                } else {
                  color = colorScheme.primary;
                  onColor = colorScheme.onPrimary;
                }
              } else {
                color = colorScheme.surfaceVariant;
                onColor = colorScheme.onSurfaceVariant;
              }
            } else {
              color = colorScheme.surfaceVariant;
              onColor = colorScheme.onSurfaceVariant;
            }

            return AnimatedContainer(
              width: width,
              height: height,
              duration: const Duration(seconds: 4),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: color,
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      name,
                      style: textTheme.headlineSmall!.copyWith(color: onColor),
                    ),
                    if (itemCount != null)
                      Text(
                        '$itemCount item(s)',
                        style: textTheme.bodyLarge!.copyWith(color: onColor),
                      ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}