import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../routes/app_pages.dart';

class ScannerWidget extends StatelessWidget {
  final colors = RxList<Color>();
  final colorNames = RxList<String>();
  final onColors = RxList<Color>();
  final colorIdx = RxInt(0);

  ScannerWidget({
    super.key,
  });

  void setUpColors(ColorScheme colorScheme) {
    colors.addAll([
      colorScheme.primary,
      colorScheme.secondary,
      colorScheme.tertiary,
      colorScheme.error,
      colorScheme.primaryContainer,
      colorScheme.secondaryContainer,
      colorScheme.tertiaryContainer,
      colorScheme.errorContainer,
      colorScheme.primaryFixed,
      colorScheme.secondaryFixed,
      colorScheme.tertiaryFixed,
      colorScheme.primaryFixedDim,
      colorScheme.secondaryFixedDim,
      colorScheme.tertiaryFixedDim,
      colorScheme.background,
      colorScheme.surface,
      colorScheme.surfaceVariant,
      colorScheme.inverseSurface
    ]);
    onColors.addAll([
      colorScheme.onPrimary,
      colorScheme.onSecondary,
      colorScheme.onTertiary,
      colorScheme.onError,
      colorScheme.onPrimaryContainer,
      colorScheme.onSecondaryContainer,
      colorScheme.onTertiaryContainer,
      colorScheme.onErrorContainer,
      colorScheme.onPrimaryFixed,
      colorScheme.onSecondaryFixed,
      colorScheme.onTertiaryFixed,
      colorScheme.onPrimaryFixedVariant,
      colorScheme.onSecondaryFixedVariant,
      colorScheme.onTertiaryFixedVariant,
      colorScheme.onBackground,
      colorScheme.onSurface,
      colorScheme.onSurfaceVariant,
      colorScheme.onInverseSurface
    ]);
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    if (colors.length == 0) {
      setUpColors(colorScheme);
    }

    return Material(
      elevation: 2,
      borderRadius: const BorderRadius.all(Radius.circular(20)),
      child: GestureDetector(
        onTap: () {
          Get.toNamed(Routes.SCANNER);
        },
        onPanEnd: (details) {
          colorIdx.value = (colorIdx.value + 1) % colors.length;
        },
        child: ObxValue(
            (data) => AnimatedContainer(
                  width: Get.width,
                  height: 2*Get.width / 5 / 1.618,
                  curve: Curves.fastEaseInToSlowEaseOut,
                  duration: Duration(seconds: 2),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'SCANNER',
                        style: textTheme.headlineMedium!.copyWith(
                          fontWeight: FontWeight.w300,
                          color: onColors[data.value],
                        ),
                      ), // Text
                      Text(
                        'SCANNER',
                        style: textTheme.bodyLarge!.copyWith(
                          fontWeight: FontWeight.w300,
                          color: onColors[data.value],
                        ),
                      ), // Text
                    ],
                  ), // Column
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(20),
                    ), // BorderRadius
                    color: colors[data.value],
                  ), // BoxDecoration
                ), // Container
            colorIdx), // ObxValue
      ), // InkWell
    ); // Material
  }
}
