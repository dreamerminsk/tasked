import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HealthWidget extends StatelessWidget {
  final String started;
  final int requests;
  final double rpm;
  
  const HealthWidget({
    super.key,
    this.started = 'NOT IMPLEMENTED',
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
            started,
            style: textTheme.headlineSmall!
              .copyWith(
                color: colorScheme.onSecondaryContainer
              ),
          ), // Text
          Text(
            'requests: $requests, rpm: ${rpm.toStringAsFixed(2)}',
            style: textTheme.titleLarge!
              .copyWith(
                color: colorScheme.onSecondaryContainer
              ),
          ), // Text
        ],
      ), // Column
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ), // BorderRadius
        color: colorScheme.secondaryContainer,
      ), // BoxDecoration
    ); //Container
  }
}
