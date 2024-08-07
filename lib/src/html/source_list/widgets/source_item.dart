import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../sources.dart';

class SourceItem extends StatelessWidget {
  const SourceItem({
    super.key,
    required this.location,
    this.onTap,
  });

  final Source location;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return InkWell(
      onTap: () {
        onTap?.call();
      },
      borderRadius: BorderRadius.circular(20),
      child: AspectRatio(
        aspectRatio: 2 * 1.618,
        child: Container(
          width: Get.width - 16.0,
          decoration: BoxDecoration(
            color: colorScheme.primaryFixed,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: colorScheme.primary, width: 3.0),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(4.0),
                decoration: BoxDecoration(
                  color: colorScheme.primaryFixedDim,
                  borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(20.0 - 3.0)),
                  border: Border(
                    bottom: BorderSide(color: colorScheme.primary, width: 3.0),
                  ),
                ),
                child: Text(
                  location.runtimeType.toString(),
                  style: textTheme.titleLarge
                      ?.copyWith(color: colorScheme.onPrimaryFixedVariant),
                  textAlign: TextAlign.center,
                ),
              ),
              Expanded(
                child: Center(
                  child: Text(
                    location.toShortString(),
                    style: textTheme.headlineLarge?.copyWith(
                      color: colorScheme.onPrimaryFixed,
                      fontWeight: FontWeight.w300,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
