import 'package:duration/duration.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class HealthWidget extends StatelessWidget {
  final DateTime started;
  final int requests;
  final double rpm;
  final int received;
  
  const HealthWidget({
    super.key,
    required this.started,
    this.requests = 0,
    this.rpm = 0.0,
    this.received = 0,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      width: Get.width,
      height: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
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
                'requests: $requests, rpm: ${rpm.toStringAsFixed(2)}, rph: ${(60*rpm).toStringAsFixed(2)}',
                style: textTheme.bodyLarge!
                  .copyWith(
                    color: colorScheme.onPrimary
                  ),
              ), // Text
              Text(
                'received: $received, bpm: ${_bpm(started, received).toStringAsFixed(0)}, bph: ${_bph(started, received).toStringAsFixed(0)}',
                style: textTheme.bodyLarge!
                  .copyWith(
                    color: colorScheme.onPrimary
                  ),
              ), // Text
            ],
          ), // Column
        ],
      ), // Row
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ), // BorderRadius
        color: colorScheme.primary,
      ), // BoxDecoration
    ); //Container
  }

  double _bpm(DateTime s, int r) {
    return 60 * r / (DateTime.now().difference(s).inSeconds);
  }

  double _bph(DateTime s, int r) {
    return 60 * 60 * r / (DateTime.now().difference(s).inSeconds);
  }
}
