import 'package:flutter/material.dart';
import 'package:get/get.dart';

//import '../debug_controller.dart';

class ColorSchemePage extends StatelessWidget {

  @override
  Widget build(context) {
    //final DebugController c = Get.find(tag: 'debugger');
    //final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
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
              title: 'background',
              background: colorScheme.background,
              foreground: colorScheme.onBackground,
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
              title: 'surfaceVariant',
              background: colorScheme.surfaceVariant,
              foreground: colorScheme.onSurfaceVariant,
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



class SampleColor extends StatelessWidget {
  final String title;
  final Color background;
  final Color foreground;

  const SampleColor({
    required this.title,
    required this.background,
    required this.foreground,
  });

  @override
  Widget build(context) {
    final textTheme = Theme.of(context).textTheme;
    //final colorScheme = Theme.of(context).colorScheme;

    return Material(
      elevation: 2,
      borderRadius:
        BorderRadius.all(Radius.circular(20)),
      child: Container(
        width: Get.width,
        height: 100,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Text(
              title,
              style: textTheme.titleMedium!
                .copyWith(
                  color: foreground,
              ),
            ), // Text
            Text(
              '$background',
              style: textTheme.bodyMedium!
                .copyWith(
                  color: foreground,
              ),
            ), // Text
          ],
        ), // Column
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ), // BorderRadius
          color: background,
        ), // BoxDecoration
      ), // Container
    ); // Material
  }
}
