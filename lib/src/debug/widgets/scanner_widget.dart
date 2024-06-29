import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../routes/app_pages.dart';

class ScannerWidget extends StatelessWidget {
  final colors = RxList<Color>();
  final colorNames = RxList<String>();
  final onColors = RxList<Color>();
  final colorIdx = RxInt(0);

  ScannerWidget({super.key});

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
      colorScheme.surface,
      colorScheme.surfaceDim,
      colorScheme.inverseSurface,
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
      colorScheme.onSurface,
      colorScheme.onSurface,
      colorScheme.onInverseSurface,
    ]);
    colorNames.addAll([
      'primary',
      'secondary',
      'tertiary',
      'error',
      'primaryContainer',
      'secondaryContainer',
      'tertiaryContainer',
      'errorContainer',
      'primaryFixed',
      'secondaryFixed',
      'tertiaryFixed',
      'primaryFixedDim',
      'secondaryFixedDim',
      'tertiaryFixedDim',
      'surface',
      'surfaceDim',
      'inverseSurface',
    ]);
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    if (colors.isEmpty) {
      setUpColors(colorScheme);
    }

    return Material(
      elevation: 2,
      borderRadius: BorderRadius.circular(20),
      child: GestureDetector(
        onTap: () => Get.toNamed(Routes.SCANNER),
        onPanEnd: (details) {
          colorIdx.value = (colorIdx.value + 1) % colors.length;
        },
        child: Obx(
          () => AnimatedContainer(
            width: Get.width,
            height: 2 * Get.width / 5 / 1.618,
            curve: Curves.fastEaseInToSlowEaseOut,
            duration: Duration(seconds: 2),
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: colors[colorIdx.value],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'SCANNER',
                  style: textTheme.headlineMedium!.copyWith(
                    fontWeight: FontWeight.w300,
                    color: onColors[colorIdx.value],
                  ),
                ),
                Text(
                  colorNames[colorIdx.value],
                  style: textTheme.bodyLarge!.copyWith(
                    fontWeight: FontWeight.w300,
                    color: onColors[colorIdx.value],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
