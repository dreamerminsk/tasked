import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RequestedPaths extends StatelessWidget {
  RequestedPaths({
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

    return FutureBuilder(
      future: request,
      builder: (ctx, snapshot) {
        var color = colorScheme.surfaceVariant;
        var onColor = colorScheme.onSurfaceVariant;
        List<Directory?>? data;
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) {
            color = colorScheme.error;
            onColor = colorScheme.onError;
          } else if (snapshot.hasData) {
            data = snapshot.data;
            if (data?.isEmpty ?? true) {
              color = colorScheme.primaryContainer;
              onColor = colorScheme.onPrimaryContainer;
            } else {
              color = colorScheme.primary;
              onColor = colorScheme.onPrimary;
            }
          }
        }

        return AnimatedContainer(
          width: Get.width - 2 * 8.0,
          height: (Get.width - 2 * 8.0) / 1.618 / 2.0,
          duration: Duration(seconds: 4),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                '$name',
                style: textTheme.headlineSmall!.copyWith(color: onColor),
              ), // Text
              Visibility(
                visible: data != null,
                child: Text(
                  "${data!.length} item(s)",
                  style: textTheme.bodyLarge!.copyWith(color: onColor),
                ), // Text
              ), // Visibility
            ],
          ), // Column
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(
              Radius.circular(20),
            ), // BorderRadius
            color: color,
          ), // BoxDecoration
        ); //Container
      },
    );
  }
}
