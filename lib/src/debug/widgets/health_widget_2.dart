import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/instances.dart';
import '../debug_controller.dart';

class HealthWidget extends StatelessWidget {
  const HealthWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final DebugController c = Get.find(tag: 'debugger');
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      width: Get.width,
      height: 200,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: colorScheme.primary,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Obx(
            () => InstanceInfoList(c.updateTick, c.instanceStats),
          ),
          RotatedBox(
            quarterTurns: 3,
            child: Text(
              'Health Status',
              style:
                  textTheme.titleLarge?.copyWith(color: colorScheme.onPrimary),
            ),
          ),
        ],
      ),
    );
  }
}

class InstanceInfoList extends StatelessWidget {
  const InstanceInfoList(this.tick, this.stats, {super.key});

  final RxInt tick;
  final Map<String, InstanceStats> stats;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: stats.entries
          .take(7)
          .map(
            (entry) => InstanceInfoItem(
              name: entry.key,
              activeCount: entry.value.activeCount,
              totalCount: entry.value.totalCount,
              elapsedTime: entry.value.getElapsedTime(),
              tick: tick,
              textStyle:
                  textTheme.bodyMedium?.copyWith(color: colorScheme.onPrimary),
            ),
          )
          .toList(),
    );
  }
}

class InstanceInfoItem extends StatelessWidget {
  const InstanceInfoItem({
    super.key,
    required this.name,
    required this.activeCount,
    required this.totalCount,
    required this.elapsedTime,
    required this.tick,
    required this.textStyle,
  });

  final String name;
  final int activeCount;
  final int totalCount;
  final Duration elapsedTime;
  final RxInt tick;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return Text(
      '$name: $activeCount of $totalCount, ${_formatTime(elapsedTime)}, $tick',
      style: textStyle,
    );
  }

  String _formatTime(Duration duration) {
    if (duration.inSeconds < 60) {
      return '${duration.inSeconds}s';
    } else if (duration.inMinutes < 60) {
      return '${duration.inMinutes}min';
    } else {
      return '${duration.inHours}hr';
    }
  }
}
