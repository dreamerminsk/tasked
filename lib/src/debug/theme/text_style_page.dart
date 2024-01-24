import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TextStylePage extends StatelessWidget {

  final TextStyle textStyle;

  const TextStylePage({
    super.key,
    required this.textStyle,
  });

  @override
  Widget build(context) {
    final textTheme = Theme.of(context).textTheme;
    //final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      body: ListView(
        //padding: EdgeInsets.all(8),
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(8),
            child: SampleObject(
              title: 'background',
              object: textStyle.background,
            ), // SampleObject
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