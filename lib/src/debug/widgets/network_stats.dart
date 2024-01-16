import 'package:duration/duration.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class NetworkStats extends StatelessWidget {
  final DateTime started;
  final int requests;
  final double rpm;
  final int received;
  final Map lastRes;
  
  const NetworkStats({
    super.key,
    required this.started,
    this.requests = 0,
    this.rpm = 0.0,
    this.received = 0,
    required this.lastRes,
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
                'requests: $requests, rpm: ${rpm.toStringAsFixed(1)}',
                style: textTheme.bodyLarge!
                  .copyWith(
                    color: colorScheme.onPrimary
                  ),
              ), // Text
              Text(
                'received: $received, bpm: ${_bpm(started, received).toStringAsFixed(0)}',
                style: textTheme.bodyLarge!
                  .copyWith(
                    color: colorScheme.onPrimary
                  ),
              ), // Text
              Text(
                'last: ${lastRes.containsKey("time") ? DateFormat.Hms().format(lastRes["time"]) : "~:~:~"}, total: ${lastRes["total"] ?? 0}',
                style: textTheme.bodyLarge!
                  .copyWith(
                    color: colorScheme.onPrimary
                  ),
              ), // Text
            ],
          ), // Column
          RotatedBox(
            quarterTurns: 3,
            child: Text('Network Stats',
              style: textTheme.titleLarge!
                .copyWith(
                  color: colorScheme.onPrimary
                ),
            ), // Text
          ), // RotatedBox
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
}
