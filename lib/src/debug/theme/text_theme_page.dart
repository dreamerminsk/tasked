import 'package:flutter/material.dart';
import 'package:get/get.dart';

//import '../debug_controller.dart';

class TextThemePage extends StatelessWidget {

  @override
  Widget build(context) {
    //final DebugController c = Get.find(tag: 'debugger');
    final textTheme = Theme.of(context).textTheme;
    //final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      body: ListView(
        //padding: EdgeInsets.all(8),
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(8),
            child: SampleStyle(
              title: 'displayLarge',
              style: textTheme.displayLarge!
            ), // TextContainer
          ), // Padding
          Padding(
            padding: EdgeInsets.all(8),
            child: SampleStyle(
              title: 'displayMedium',
              style: textTheme.displayMedium!
            ), // TextContainer
          ), // Padding
          Padding(
            padding: EdgeInsets.all(8),
            child: SampleStyle(
              title: 'displaySmall',
              style: textTheme.displaySmall!
            ), // TextContainer
          ), // Padding
          Padding(
            padding: EdgeInsets.all(8),
            child: SampleStyle(
              title: 'headlineLarge',
              style: textTheme.headlineLarge!
            ), // TextContainer
          ), // Padding
          Padding(
            padding: EdgeInsets.all(8),
            child: SampleStyle(
              title: 'headlineMedium',
              style: textTheme.headlineMedium!
            ), // TextContainer
          ), // Padding
          Padding(
            padding: EdgeInsets.all(8),
            child: SampleStyle(
              title: 'headlineSmall',
              style: textTheme.headlineSmall!
            ), // TextContainer
          ), // Padding
          Padding(
            padding: EdgeInsets.all(8),
            child: SampleStyle(
              title: 'titleLarge',
              style: textTheme.titleLarge!
            ), // TextContainer
          ), // Padding
          Padding(
            padding: EdgeInsets.all(8),
            child: SampleStyle(
              title: 'titleMedium',
              style: textTheme.titleMedium!
            ), // TextContainer
          ), // Padding
          Padding(
            padding: EdgeInsets.all(8),
            child: SampleStyle(
              title: 'titleSmall',
              style: textTheme.titleSmall!
            ), // TextContainer
          ), // Padding
          Padding(
            padding: EdgeInsets.all(8),
            child: SampleStyle(
              title: 'labelLarge',
              style: textTheme.labelLarge!
            ), // TextContainer
          ), // Padding
          Padding(
            padding: EdgeInsets.all(8),
            child: SampleStyle(
              title: 'labelMedium',
              style: textTheme.labelMedium!
            ), // TextContainer
          ), // Padding
          Padding(
            padding: EdgeInsets.all(8),
            child: SampleStyle(
              title: 'labelSmall',
              style: textTheme.labelSmall!
            ), // TextContainer
          ), // Padding
          Padding(
            padding: EdgeInsets.all(8),
            child: SampleStyle(
              title: 'bodyLarge',
              style: textTheme.bodyLarge!
            ), // TextContainer
          ), // Padding
          Padding(
            padding: EdgeInsets.all(8),
            child: SampleStyle(
              title: 'bodyMedium',
              style: textTheme.bodyMedium!
            ), // TextContainer
          ), // Padding
          Padding(
            padding: EdgeInsets.all(8),
            child: SampleStyle(
              title: 'bodySmall',
              style: textTheme.bodySmall!
            ), // TextContainer
          ), // Padding
        ],
      ), // ListView
    );
  }

}

class SampleStyle extends StatelessWidget {
  final String title;
  final TextStyle style;
  final String? text;
  //final Color background;
  //final Color foreground;

  const SampleStyle({
    required this.title,
    required this.style,
    this.text,
    //required this.background,
    //required this.foreground,
  });

  @override
  Widget build(context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Material(
      elevation: 2,
      borderRadius:
        BorderRadius.all(Radius.circular(20)),
      child: Container(
        width: Get.width,
        height: 100,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text(
              text ?? title,
              style: style
                .copyWith(
                  color: colorScheme.onPrimary,
              ),
            ), // Text,
            Text(
              "${style.fontFamily ?? '.'}, ${style.fontSize ?? 0.0} em, ${style.debugLabel}",
              style: textTheme.bodyLarge!
                .copyWith(
                  color: colorScheme.onPrimary,
              ),
            ), // Text,
          ],
        ), // Column
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ), // BorderRadius
          color: colorScheme.primary,
        ), // BoxDecoration
      ), // Container
    ); // Material
  }
}
