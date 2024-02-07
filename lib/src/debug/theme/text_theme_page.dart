import 'package:flutter/material.dart';
//import 'package:get/get.dart';

import 'sample_text_style.dart';

class TextThemePage extends StatelessWidget {
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
            child: SampleTextStyle(
                title: 'displayLarge',
                style: textTheme.displayLarge!), // TextContainer
          ), // Padding
          Padding(
            padding: EdgeInsets.all(8),
            child: SampleTextStyle(
                title: 'displayMedium',
                style: textTheme.displayMedium!), // TextContainer
          ), // Padding
          Padding(
            padding: EdgeInsets.all(8),
            child: SampleTextStyle(
                title: 'displaySmall',
                style: textTheme.displaySmall!), // TextContainer
          ), // Padding
          Padding(
            padding: EdgeInsets.all(8),
            child: SampleTextStyle(
                title: 'headlineLarge',
                style: textTheme.headlineLarge!), // TextContainer
          ), // Padding
          Padding(
            padding: EdgeInsets.all(8),
            child: SampleTextStyle(
                title: 'headlineMedium',
                style: textTheme.headlineMedium!), // TextContainer
          ), // Padding
          Padding(
            padding: EdgeInsets.all(8),
            child: SampleTextStyle(
                title: 'headlineSmall',
                style: textTheme.headlineSmall!), // TextContainer
          ), // Padding
          Padding(
            padding: EdgeInsets.all(8),
            child: SampleTextStyle(
                title: 'titleLarge',
                style: textTheme.titleLarge!), // TextContainer
          ), // Padding
          Padding(
            padding: EdgeInsets.all(8),
            child: SampleTextStyle(
                title: 'titleMedium',
                style: textTheme.titleMedium!), // TextContainer
          ), // Padding
          Padding(
            padding: EdgeInsets.all(8),
            child: SampleTextStyle(
                title: 'titleSmall',
                style: textTheme.titleSmall!), // TextContainer
          ), // Padding
          Padding(
            padding: EdgeInsets.all(8),
            child: SampleTextStyle(
                title: 'labelLarge',
                style: textTheme.labelLarge!), // TextContainer
          ), // Padding
          Padding(
            padding: EdgeInsets.all(8),
            child: SampleTextStyle(
                title: 'labelMedium',
                style: textTheme.labelMedium!), // TextContainer
          ), // Padding
          Padding(
            padding: EdgeInsets.all(8),
            child: SampleTextStyle(
                title: 'labelSmall',
                style: textTheme.labelSmall!), // TextContainer
          ), // Padding
          Padding(
            padding: EdgeInsets.all(8),
            child: SampleTextStyle(
                title: 'bodyLarge',
                style: textTheme.bodyLarge!), // TextContainer
          ), // Padding
          Padding(
            padding: EdgeInsets.all(8),
            child: SampleTextStyle(
                title: 'bodyMedium',
                style: textTheme.bodyMedium!), // TextContainer
          ), // Padding
          Padding(
            padding: EdgeInsets.all(8),
            child: SampleTextStyle(
                title: 'bodySmall',
                style: textTheme.bodySmall!), // TextContainer
          ), // Padding
        ],
      ), // ListView
    );
  }
}
