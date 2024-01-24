import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SampleObject extends StatelessWidget {
  final String title;
  final Object object;

  const SampleObject({
    required this.title,
    required this.object,
  });

  @override
  Widget build(context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Material(
      elevation: 2,
      borderRadius:
        BorderRadius.all(Radius.circular(20)),
      child: Container(
        width: Get.width,
        height: 100,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Text(
              object.runtimeType.toString(),
              style: textTheme.titleLarge!
                .copyWith(
                  color: colorScheme.onPrimary,
              ),
            ), // Text,
            Text(
              title,
              style: textTheme.bodyLarge!
                .copyWith(
                  color: colorScheme.onPrimary,
              ),
            ), // Text,
          ],
        ), // Column
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ), // BorderRadius
          color: colorScheme.primary,
        ), // BoxDecoration
      ), // Container
    ); // Material
  }
}
