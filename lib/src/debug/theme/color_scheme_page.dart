import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tasked/main.dart';

import 'sample_color.dart';
import '../../core/widgets/icon_buttons.dart';
import '../../core/color_utils.dart';
import '../../routes/app_pages.dart';

class ColorSchemePage extends StatelessWidget {
  final isShowInfo = ValueNotifier<bool>(false);

  @override
  Widget build(context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(title: Text('colorScheme'), actions: <Widget>[
        IconButton(
          icon: Icon(Icons.info_outline_rounded),
          color: Theme.of(context).colorScheme.primary,
          onPressed: () {
            isShowInfo.value = !isShowInfo.value;
          },
        ),
        DebugIconButton(
          route: Routes.DEBUG,
        ), // DebugIconButton
      ]),
      body: ListView(
        //padding: EdgeInsets.all(8),
        children: <Widget>[
          ValueListenableBuilder<bool>(
            valueListenable: isShowInfo,
            builder: (context, value, child) {
              return Container(
                width: Get.width,
                height: Get.width / 1.618 / 2,
                padding: EdgeInsets.all(16.0),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: colorScheme.primaryFixed,
                  border: Border(
                    top: BorderSide(
                      color: colorScheme.primary,
                      width: 1.0,
                    ), // BorderSide
                    bottom: BorderSide(
                      color: colorScheme.primary,
                      width: 1.0,
                    ), // BorderSide
                  ), // Border
                ), // BoxDecoration
                child: Column(
                  children: [
                    Text(
                      MyApp.shadeColor.name,
                      style: textTheme.titleLarge!.copyWith(
                        color: colorScheme.onPrimaryFixed,
                      ),
                    ),
                    Text(
                      MyApp.variant.toString().split(".").last,
                      style: textTheme.titleLarge!.copyWith(
                        color: colorScheme.onPrimaryFixed,
                      ),
                    ),
                  ],
                ), // Column
              ); // Container
            },
          ),
          Padding(
            padding: EdgeInsets.all(8),
            child: SampleColor(
              title: 'primary',
              background: colorScheme.primary,
              foreground: colorScheme.onPrimary,
            ), // ColorContainer
          ), // Padding
          Padding(
            padding: EdgeInsets.all(8),
            child: SampleColor(
              title: 'primaryContainer',
              background: colorScheme.primaryContainer,
              foreground: colorScheme.onPrimaryContainer,
            ), // ColorContainer
          ), // Padding
          Padding(
            padding: EdgeInsets.all(8),
            child: SampleColor(
              title: 'primaryFixed',
              background: colorScheme.primaryFixed,
              foreground: colorScheme.onPrimaryFixed,
            ), // ColorContainer
          ), // Padding
          Padding(
            padding: EdgeInsets.all(8),
            child: SampleColor(
              title: 'primaryFixedDim',
              background: colorScheme.primaryFixedDim,
              foreground: colorScheme.onPrimaryFixedVariant,
            ), // ColorContainer
          ), // Padding
          Padding(
            padding: EdgeInsets.all(8),
            child: SampleColor(
              title: 'secondary',
              background: colorScheme.secondary,
              foreground: colorScheme.onSecondary,
            ), // ColorContainer
          ), // Padding
          Padding(
            padding: EdgeInsets.all(8),
            child: SampleColor(
              title: 'secondaryContainer',
              background: colorScheme.secondaryContainer,
              foreground: colorScheme.onSecondaryContainer,
            ), // ColorContainer
          ), // Padding
          Padding(
            padding: EdgeInsets.all(8),
            child: SampleColor(
              title: 'secondaryFixed',
              background: colorScheme.secondaryFixed,
              foreground: colorScheme.onSecondaryFixed,
            ), // ColorContainer
          ), // Padding
          Padding(
            padding: EdgeInsets.all(8),
            child: SampleColor(
              title: 'secondaryFixedDim',
              background: colorScheme.secondaryFixedDim,
              foreground: colorScheme.onSecondaryFixedVariant,
            ), // ColorContainer
          ), // Padding
          Padding(
            padding: EdgeInsets.all(8),
            child: SampleColor(
              title: 'tertiary',
              background: colorScheme.tertiary,
              foreground: colorScheme.onTertiary,
            ), // ColorContainer
          ), // Padding
          Padding(
            padding: EdgeInsets.all(8),
            child: SampleColor(
              title: 'tertiaryContainer',
              background: colorScheme.tertiaryContainer,
              foreground: colorScheme.onTertiaryContainer,
            ), // ColorContainer
          ), // Padding
          Padding(
            padding: EdgeInsets.all(8),
            child: SampleColor(
              title: 'tertiaryFixed',
              background: colorScheme.tertiaryFixed,
              foreground: colorScheme.onTertiaryFixed,
            ), // ColorContainer
          ), // Padding
          Padding(
            padding: EdgeInsets.all(8),
            child: SampleColor(
              title: 'tertiaryFixedDim',
              background: colorScheme.tertiaryFixedDim,
              foreground: colorScheme.onTertiaryFixedVariant,
            ), // ColorContainer
          ), // Padding
          Padding(
            padding: EdgeInsets.all(8),
            child: SampleColor(
              title: 'error',
              background: colorScheme.error,
              foreground: colorScheme.onError,
            ), // ColorContainer
          ), // Padding
          Padding(
            padding: EdgeInsets.all(8),
            child: SampleColor(
              title: 'errorContainer',
              background: colorScheme.errorContainer,
              foreground: colorScheme.onErrorContainer,
            ), // ColorContainer
          ), // Padding
          Padding(
            padding: EdgeInsets.all(8),
            child: SampleColor(
              title: 'surface',
              background: colorScheme.surface,
              foreground: colorScheme.onSurface,
            ), // ColorContainer
          ), // Padding
          Padding(
            padding: EdgeInsets.all(8),
            child: SampleColor(
              title: 'surfaceDim',
              background: colorScheme.surfaceDim,
              foreground: colorScheme.onSurface,
            ), // ColorContainer
          ), // Padding
          Padding(
            padding: EdgeInsets.all(8),
            child: SampleColor(
              title: 'surfaceBright',
              background: colorScheme.surfaceBright,
              foreground: colorScheme.onSurface,
            ), // ColorContainer
          ), // Padding
          Padding(
            padding: EdgeInsets.all(8),
            child: SampleColor(
              title: 'surfaceContainerLowest',
              background: colorScheme.surfaceContainerLowest,
              foreground: colorScheme.onSurface,
            ), // ColorContainer
          ), // Padding
          Padding(
            padding: EdgeInsets.all(8),
            child: SampleColor(
              title: 'surfaceContainerLow',
              background: colorScheme.surfaceContainerLow,
              foreground: colorScheme.onSurface,
            ), // ColorContainer
          ), // Padding
          Padding(
            padding: EdgeInsets.all(8),
            child: SampleColor(
              title: 'surfaceContainer',
              background: colorScheme.surfaceContainer,
              foreground: colorScheme.onSurface,
            ), // ColorContainer
          ), // Padding
          Padding(
            padding: EdgeInsets.all(8),
            child: SampleColor(
              title: 'surfaceContainerHigh',
              background: colorScheme.surfaceContainerHigh,
              foreground: colorScheme.onSurface,
            ), // ColorContainer
          ), // Padding
          Padding(
            padding: EdgeInsets.all(8),
            child: SampleColor(
              title: 'surfaceContainerHighest',
              background: colorScheme.surfaceContainerHighest,
              foreground: colorScheme.onSurface,
            ), // ColorContainer
          ), // Padding
          Padding(
            padding: EdgeInsets.all(8),
            child: SampleColor(
              title: 'outline',
              background: colorScheme.outline,
              foreground: ColorUtils.contrastThemeColor(colorScheme.outline),
            ), // ColorContainer
          ), // Padding
          Padding(
            padding: EdgeInsets.all(8),
            child: SampleColor(
              title: 'outlineVariant',
              background: colorScheme.outlineVariant,
              foreground:
                  ColorUtils.contrastThemeColor(colorScheme.outlineVariant),
            ), // ColorContainer
          ), // Padding
          Padding(
            padding: EdgeInsets.all(8),
            child: SampleColor(
              title: 'inverseSurface',
              background: colorScheme.inverseSurface,
              foreground: colorScheme.onInverseSurface,
            ), // ColorContainer
          ), // Padding
          Padding(
            padding: EdgeInsets.all(8),
            child: SampleColor(
              title: 'inversePrimary',
              background: colorScheme.inversePrimary,
              foreground: colorScheme.primary,
            ), // ColorContainer
          ), // Padding
          Padding(
            padding: EdgeInsets.all(8),
            child: SampleColor(
              title: 'shadow',
              background: colorScheme.shadow,
              foreground: ColorUtils.contrastThemeColor(colorScheme.shadow),
            ), // ColorContainer
          ), // Padding
          Padding(
            padding: EdgeInsets.all(8),
            child: SampleColor(
              title: 'scrim',
              background: colorScheme.scrim,
              foreground: ColorUtils.contrastThemeColor(colorScheme.scrim),
            ), // ColorContainer
          ), // Padding
          Padding(
            padding: EdgeInsets.all(8),
            child: SampleColor(
              title: 'surfaceTint',
              background: colorScheme.surfaceTint,
              foreground:
                  ColorUtils.contrastThemeColor(colorScheme.surfaceTint),
            ), // ColorContainer
          ), // Padding
        ],
      ), // ListView
    );
  }
}
