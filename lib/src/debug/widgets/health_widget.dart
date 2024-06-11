//import 'package:duration/duration.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
//import 'package:intl/intl.dart';

import '../models/instances.dart';
import '../debug_controller.dart';

class HealthWidget extends StatelessWidget {
  
  const HealthWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
final DebugController c= Get.find(tag: 'debugger');

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
            children: Obx(()=>
_buildList(context, c.updateTick,c.instanceStats),
),
          ), // Column
          RotatedBox(
            quarterTurns: 3,
            child: Container(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
              child: Text(
                'Health Status',
                style: textTheme.titleLarge!
                    .copyWith(color: colorScheme.onPrimary),
              ), // Text
            ), // Padding
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

  List<Widget> _buildList(
      BuildContext context, RxInt tick, Map<String, InstanceStats> stats) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return stats.entries
        .take(7)
        .map<Widget>((item) => Text(
              '${item.key}: ${item.value.activeCount} of ${item.value.totalCount}, ${item.value.getElapsedTime().inMinutes} min., $tick',
              style:
                  textTheme.bodyMedium!.copyWith(color: colorScheme.onPrimary),
            ))
        .toList();
  }

String _time(Duration d) {
String timeString = '';
if (d.inSeconds < 60) {
timeString = '${d.inSeconds} s';
} else if (d.inMinutes < 60) {
timeString = '${d.inMinutes} min';
} else {
timeString = '${d.inHours} hr';
}
}
}
