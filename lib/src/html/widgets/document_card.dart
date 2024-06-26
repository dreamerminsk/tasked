import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DocumentCard extends StatelessWidget {
  const DocumentCard({
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
        aspectRatio: 3 * 1.618,
        child: Container(
          width: Get.width - 2 * 8.0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                '${uri?.host}',
                style: textTheme.headlineLarge!.copyWith(
                  color: colorScheme.onPrimaryFixed,
                  fontWeight: FontWeight.w300,
                ),
              ), // Text
            ],
          ), // Column
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(
              Radius.circular(20),
            ), // BorderRadius
            color: colorScheme.primaryFixed,
          ), // BoxDecoration
        ), // Container
      ), // AspectRatio
    ); // InkWell
  }
}
