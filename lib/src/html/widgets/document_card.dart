import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DocumentCard extends StatelessWidget {
  const DocumentCard({
    super.key,
    this.padding,
  });

  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return GestureDetector(
      onTap: () {
        
      },
      child: Container(
        width: Get.width,
        height: Get.width / 2.0 / 1.618,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'html ::: document',
              style: textTheme.headlineLarge!.copyWith(
                color: colorScheme.onPrimary,
                fontWeight: FontWeight.w300,
              ),
            ), // Text
          ],
        ), // Column
        margin: this.padding ?? const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(20),
          ), // BorderRadius
          color: colorScheme.primary,
        ), // BoxDecoration
      ), // Container
    ); // GestureDetector
  }
}
