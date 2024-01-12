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
            child: ColorContainer(
              title: 'primary',
              background: colorScheme.primary,
              foreground: colorScheme.onPrimary,
            ), // ColorContainer
          ), // Padding
          Padding(
            padding: EdgeInsets.all(8),
            child: ColorContainer(
              title: 'secondary',
              background: colorScheme.secondary,
              foreground: colorScheme.onSecondary,
            ), // ColorContainer
          ), // Padding
          Padding(
            padding: EdgeInsets.all(8),
            child: ColorContainer(
              title: 'tertiary',
              background: colorScheme.tertiary,
              foreground: colorScheme.onTertiary,
            ), // ColorContainer
          ), // Padding
          Padding(
            padding: EdgeInsets.all(8),
            child: ColorContainer(
              title: 'error',
              background: colorScheme.error,
              foreground: colorScheme.onError,
            ), // ColorContainer
          ), // Padding
          Padding(
            padding: EdgeInsets.all(8),
            child: ColorContainer(
              title: 'background',
              background: colorScheme.background,
              foreground: colorScheme.onBackground,
            ), // ColorContainer
          ), // Padding
          Padding(
            padding: EdgeInsets.all(8),
            child: ColorContainer(
              title: 'surface',
              background: colorScheme.surface,
              foreground: colorScheme.onSurface,
            ), // ColorContainer
          ), // Padding
          Padding(
            padding: EdgeInsets.all(8),
            child: ColorContainer(
              title: 'surfaceVariant',
              background: colorScheme.surfaceVariant,
              foreground: colorScheme.onSurfaceVariant,
            ), // ColorContainer
          ), // Padding
          Padding(
            padding: EdgeInsets.all(8),
            child: ColorContainer(
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



class ColorContainer extends StatelessWidget {
  final String title;
  final Color background;
  final Color foreground;

  const ColorContainer({
    required this.title,
    required this.background,
    required this.foreground,
  });

  @override
  Widget build(context) {
    final textTheme = Theme.of(context).textTheme;
    //final colorScheme = Theme.of(context).colorScheme;

    return Material(
      elevation: 4,
      borderRadius:
        BorderRadius.all(Radius.circular(20)),
      child: Container(
        width: Get.width,
        height: 96,
        child: Center(
          child: Text(
            title,
            style: textTheme.headlineMedium!
              .copyWith(
                color: foreground,
            ),
          ), // Text,
        ), // Center
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
