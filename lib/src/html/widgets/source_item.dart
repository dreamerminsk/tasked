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
        aspectRatio: 3 * 1.618,
        child: Container(
          width: Get.width - 2 * 8.0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                width: Get.width - 2 * 8.0,
                child: Text('Source', 
style: textTheme.titleLarge!.copyWith(
                  color: colorScheme.onPrimaryFixed,
                ),
textAlign: TextAlign.center,),
                decoration: BoxDecoration(
   color: colorScheme.primaryFixed,
borderRadius: const BorderRadius.vertical(
              top: Radius.circular(20),
            ), // BorderRadius
    border: Border(
      bottom: BorderSide(
        color: colorScheme.onPrimaryFixed,
        width: 1.5,
      ),
    ),
              ), // Container
              Expanded(
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                '${uri?.host}',
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
            color: colorScheme.primaryFixed,
          ), // BoxDecoration
        ), // Container
      ), // AspectRatio
    ); // InkWell
  }
}
