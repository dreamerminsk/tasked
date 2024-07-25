import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/color_utils.dart';

class SampleColorRed extends StatelessWidget {
  final String title;
  final int red;

  const SampleColorRed({
    super.key,
    required this.title,
    required this.red,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    final child = Container(
      width: double.infinity,
      height: Get.width / 2 / 1.618,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Color.fromARGB(255, red, 0, 0),
      ), // BoxDecoration
      padding: EdgeInsets.all(8.0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AspectRatio(
            aspectRatio: 1.0,
            child: Container(
              alignment: Alignment.center,
              child: Text('R',
                  style: Theme.of(context)
                      .textTheme
                      .displayLarge!
                      .copyWith(color: colorScheme.onPrimary)),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: colorScheme.primary,
              ), // BoxDecoration
            ), // Container
          ), // AspectRatio
          Container(
            alignment: Alignment.center,
            child: Text('$alpha',
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall!
                    .copyWith(color:ColorUtils.contrastThemeColor(Color.fromARGB(255, red, 0, 0)))),
            color: Colors.transparent,
          ), // Container
        ],
      ), // Row
    ); // Container

    return Material(
      elevation: 4,
      borderRadius: BorderRadius.circular(20),
      child: child,
    ); // Material
  }
}
