import 'package:duration/duration.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class HealthWidget extends StatelessWidget {
  final DateTime started;
  final int requests;
  final double rpm;
  
  const HealthWidget({
    super.key,
    required this.started,
    this.requests = 0,
    this.rpm = 0.0,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      width: Get.width,
      height: 200,
      child: Column(
        crossAxisAlignment:
          CrossAxisAlignment.start,
        mainAxisAlignment:
          MainAxisAlignment.spaceAround,
        children: <Widget>[
          Text(
            '${DateFormat.Hms().format(started)} — ${prettyDuration(DateTime.now().difference(started))}',
            style: textTheme.headlineSmall!
              .copyWith(
                color: colorScheme.onPrimaryContainer
              ),
          ), // Text
          Text(
            'requests: $requests, rpm: ${rpm.toStringAsFixed(2)}, rph: ${(60*rpm).toStringAsFixed(2)}',
            style: textTheme.titleLarge!
              .copyWith(
                color: colorScheme.onPrimaryContainer
              ),
          ), // Text
        ],
      ), // Column
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ), // BorderRadius
        color: colorScheme.primaryContainer,
      ), // BoxDecoration
    ); //Container
  }
}
