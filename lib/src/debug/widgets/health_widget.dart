import 'package:duration/duration.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class HealthWidget extends StatelessWidget {
  final DateTime started;
  final int instances;
  final int maxIns;
  
  const HealthWidget({
    super.key,
    required this.started,
    required this.instances,
    required this.maxIns,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      width: Get.width,
      height: 200,
      child: Row(
        mainAxisAlignment:
          MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            crossAxisAlignment:
              CrossAxisAlignment.start,
            mainAxisAlignment:
              MainAxisAlignment.spaceAround,
            children: <Widget>[
              Text(
                '${DateFormat.Hms().format(started)} — ${prettyDuration(DateTime.now().difference(started))}',
                style: textTheme.bodyLarge!
                  .copyWith(
                    color: colorScheme.onPrimary
                  ),
              ), // Text
              Text(
                'instances: $instances, max: $maxIns',
                style: textTheme.bodyLarge!
                  .copyWith(
                    color: colorScheme.onPrimary
                  ),
              ), // Text
            ],
          ), // Column
          RotatedBox(
            quarterTurns: 3,
            child: Text('Health Status',
              style: textTheme.titleLarge!
                .copyWith(
                  color: colorScheme.onPrimary
                ),
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
}
