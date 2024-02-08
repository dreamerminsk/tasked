//import 'package:duration/duration.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
//import 'package:intl/intl.dart';

class HealthWidget extends StatelessWidget {
  final Map<String, int> controllers;

  const HealthWidget({
    super.key,
    required this.controllers,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      width: Get.width,
      height: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: _buildList(context, controllers),
          ), // Column
          RotatedBox(
            quarterTurns: 3,
            child: Text(
              'Health Status',
              style:
                  textTheme.titleLarge!.copyWith(color: colorScheme.onPrimary),
            ), // Text
          ), // RotatedBox
        ],
      ), // Row
      padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ), // BorderRadius
        color: colorScheme.primary,
      ), // BoxDecoration
    ); //Container
  }

  List<Widget> _buildList(BuildContext context, Map<String, int> items) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return items.entries
        .take(4)
        .map<Widget>((item) => Text(
              '${item.key}: ${item.value}',
              style:
                  textTheme.bodyMedium!.copyWith(color: colorScheme.onPrimary),
            ))
        .toList();
  }
}
