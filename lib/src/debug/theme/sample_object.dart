import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SampleObject extends StatelessWidget {
  final String title;
  final Object? object;

  const SampleObject({
    super.key,
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
              '${object == null ? "null" : object.toString()}',
              style: textTheme.titleLarge!
                .copyWith(
                  fontWeight: FontWeight.w700,
                  color: colorScheme.onPrimary,
              ),
            ), // Text
            Divider(
              color: colorScheme.onPrimary,
            ), // Divider
            Text(
              title,
              style: textTheme.titleLarge!
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
