import 'package:flutter/material.dart';

import 'sample_color.dart';

class ColorSchemePage extends StatelessWidget {
final isShowInfo = ValueNotifier<bool>(false);
  @override
  Widget build(context) {
    //final textTheme = Theme.of(context).textTheme;
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
              title: 'inverseSurface',
              background: colorScheme.inverseSurface,
              foreground: colorScheme.onInverseSurface,
            ), // ColorContainer
          ), // Padding
        ],
      ), // ListView
    );
  }
}
