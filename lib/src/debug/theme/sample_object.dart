import 'package:flutter/foundation.dart';
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
      borderRadius: BorderRadius.all(Radius.circular(20)),
      child: Container(
        width: Get.width,
        height: Get.width / 1.618 / 2,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Expanded(
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  '${object == null ? "null" : (object is Diagnosticable ? (object! as Diagnosticable).toStringShort() : object.toString())}',
                  style: textTheme.titleLarge!.copyWith(
                    fontWeight: FontWeight.w700,
                    color: colorScheme.onPrimary,
                  ),
                ), // Text
              ), // Align
            ), // Expanded
            Divider(
              color: colorScheme.onPrimary,
            ), // Divider
            Text(
              title,
              style: textTheme.titleLarge!.copyWith(
                fontSize: textTheme.titleLarge!.fontSize! - 1,
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
