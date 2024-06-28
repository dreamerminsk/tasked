import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SourceItem extends StatelessWidget {
  const SourceItem({
    super.key,
    required this.location,
  });

  final String location;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    final uri = Uri.tryParse(location);

    return InkWell(
      onTap: () {},
      borderRadius: const BorderRadius.all(
        Radius.circular(20),
      ), // BorderRadius
      child: AspectRatio(
        aspectRatio: 2 * 1.618,
        child: Container(
          width: Get.width - 2 * 8.0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                width: Get.width - 2 * 8.0,
                padding: const EdgeInsets.all(4.0),
                child: Text(
                  uri?.host == null ? 'LocalSource' : 'WebSource',
                  style: textTheme.titleLarge!.copyWith(
                    color: colorScheme.onPrimaryFixed,
                  ),
                  textAlign: TextAlign.center,
                ),
                decoration: BoxDecoration(
                  color: colorScheme.primaryFixed,
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(20),
                  ), // BorderRadius
                  border: Border(
                    bottom: BorderSide(
                      color: colorScheme.onPrimaryFixed,
                      width: 2.0,
                    ), // BorderSide
                  ), // Border
                ), // BoxDecoration
              ), // Container
              Expanded(
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    '${uri?.host ?? location.split("/").last}',
                    style: textTheme.headlineLarge!.copyWith(
                      color: colorScheme.onPrimaryFixed,
                      fontWeight: FontWeight.w300,
                    ),
                  ), // Text
                ), // Align
              ), // Expanded
            ],
          ), // Column
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(
              Radius.circular(20),
            ), // BorderRadius
            border: const Border.all(color: colorScheme.primary, width: 2.0,), // Border
            color: colorScheme.primaryFixed,
          ), // BoxDecoration
        ), // Container
      ), // AspectRatio
    ); // InkWell
  }
}
