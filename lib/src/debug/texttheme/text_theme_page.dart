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
            child: TextContainer(
              title: 'displayLarge',
              style: textTheme.displayLarge!
            ), // TextContainer
          ), // Padding
          Padding(
            padding: EdgeInsets.all(8),
            child: TextContainer(
              title: 'displayMedium',
              style: textTheme.displayMedium!
            ), // TextContainer
          ), // Padding
          Padding(
            padding: EdgeInsets.all(8),
            child: TextContainer(
              title: 'displaySmall',
              style: textTheme.displaySmall!
            ), // TextContainer
          ), // Padding
          Padding(
            padding: EdgeInsets.all(8),
            child: TextContainer(
              title: 'headlineLarge',
              style: textTheme.headlineLarge!
            ), // TextContainer
          ), // Padding
          Padding(
            padding: EdgeInsets.all(8),
            child: TextContainer(
              title: 'headlineMedium',
              style: textTheme.headlineMedium!
            ), // TextContainer
          ), // Padding
          Padding(
            padding: EdgeInsets.all(8),
            child: TextContainer(
              title: 'headlineSmall',
              style: textTheme.headlineSmall!
            ), // TextContainer
          ), // Padding
          Padding(
            padding: EdgeInsets.all(8),
            child: TextContainer(
              title: 'titleLarge',
              style: textTheme.titleLarge!
            ), // TextContainer
          ), // Padding
          Padding(
            padding: EdgeInsets.all(8),
            child: TextContainer(
              title: 'titleMedium',
              style: textTheme.titleMedium!
            ), // TextContainer
          ), // Padding
          Padding(
            padding: EdgeInsets.all(8),
            child: TextContainer(
              title: 'titleSmall',
              style: textTheme.titleSmall!
            ), // TextContainer
          ), // Padding
          Padding(
            padding: EdgeInsets.all(8),
            child: TextContainer(
              title: 'labelLarge',
              style: textTheme.labelLarge!
            ), // TextContainer
          ), // Padding
          Padding(
            padding: EdgeInsets.all(8),
            child: TextContainer(
              title: 'labelMedium',
              style: textTheme.labelMedium!
            ), // TextContainer
          ), // Padding
          Padding(
            padding: EdgeInsets.all(8),
            child: TextContainer(
              title: 'labelSmall',
              style: textTheme.labelSmall!
            ), // TextContainer
          ), // Padding
          Padding(
            padding: EdgeInsets.all(8),
            child: TextContainer(
              title: 'bodyLarge',
              style: textTheme.bodyLarge!
            ), // TextContainer
          ), // Padding
          Padding(
            padding: EdgeInsets.all(8),
            child: TextContainer(
              title: 'bodyMedium',
              style: textTheme.bodyMedium!
            ), // TextContainer
          ), // Padding
          Padding(
            padding: EdgeInsets.all(8),
            child: TextContainer(
              title: 'bodySmall',
              style: textTheme.bodySmall!
            ), // TextContainer
          ), // Padding
        ],
      ), // ListView
    );
  }

}



class TextContainer extends StatelessWidget {
  final String title;
  final TextStyle style;
  //final Color background;
  //final Color foreground;

  const TextContainer({
    required this.title,
    required this.style,
    //required this.background,
    //required this.foreground,
  });

  @override
  Widget build(context) {
    //final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

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
            style: style
              .copyWith(
                color: colorScheme.onSurfaceVariant,
            ),
          ), // Text,
        ), // Center
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ), // BorderRadius
          color: colorScheme.surfaceVariant,
        ), // BoxDecoration
      ), // Container
    ); // Material
  }
}
