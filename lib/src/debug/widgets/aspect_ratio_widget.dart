import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AspectRatioWidget extends StatelessWidget {
  const AspectRatioWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    final cardWidth = Get.width - 2 * 8.0;
    final cardHeight = cardWidth / 1.618 / 2;

    return Material(
      elevation: 4,
      borderRadius: const BorderRadius.all(Radius.circular(20)),
      child: InkWell(
        onTap: () {
          Get.to(Routes.PATHS);
        },
        child: Container(
          width: cardWidth,
          height: cardHeight,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'aspect_ratio',
                style: textTheme.headlineSmall!
                    .copyWith(color: colorScheme.onPrimary),
              ), // Text
            ],
          ), // Column
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(
              Radius.circular(20),
            ), // BorderRadius
            color: colorScheme.primary,
          ), // BoxDecoration
        ), //Container
      ), // InkWell
    ); // Material
  }
}
