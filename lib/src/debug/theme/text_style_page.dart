import 'package:flutter/material.dart';
//import 'package:get/get.dart';

import 'sample_object.dart';

class TextStylePage extends StatelessWidget {
  final TextStyle textStyle;

  const TextStylePage({
    super.key,
    required this.textStyle,
  });

  @override
  Widget build(context) {
    //final textTheme = Theme.of(context).textTheme;
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
            child: SampleObject(
              title: 'backgroundColor',
              object: textStyle.backgroundColor,
            ), // SampleObject
          ), // Padding
          Padding(
            padding: EdgeInsets.all(8),
            child: SampleObject(
              title: 'color',
              object: textStyle.color,
            ), // SampleObject
          ), // Padding
          Padding(
            padding: EdgeInsets.all(8),
            child: SampleObject(
              title: 'debugLabel',
              object: textStyle.debugLabel,
            ), // SampleObject
          ), // Padding
          Padding(
            padding: EdgeInsets.all(8),
            child: SampleObject(
              title: 'decoration',
              object: textStyle.decoration,
            ), // SampleObject
          ), // Padding
          Padding(
            padding: EdgeInsets.all(8),
            child: SampleObject(
              title: 'decorationColor',
              object: textStyle.decorationColor,
            ), // SampleObject
          ), // Padding
          Padding(
            padding: EdgeInsets.all(8),
            child: SampleObject(
              title: 'decorationStyle',
              object: textStyle.decorationStyle,
            ), // SampleObject
          ), // Padding
          Padding(
            padding: EdgeInsets.all(8),
            child: SampleObject(
              title: 'decorationThickness',
              object: textStyle.decorationThickness,
            ), // SampleObject
          ), // Padding
          Padding(
            padding: EdgeInsets.all(8),
            child: SampleObject(
              title: 'fontFamily',
              object: textStyle.fontFamily,
            ), // SampleObject
          ), // Padding
          Padding(
            padding: EdgeInsets.all(8),
            child: SampleObject(
              title: 'fontFamilyFallback',
              object: textStyle.fontFamilyFallback,
            ), // SampleObject
          ), // Padding
          Padding(
            padding: EdgeInsets.all(8),
            child: SampleObject(
              title: 'fontFeatures',
              object: textStyle.fontFeatures,
            ), // SampleObject
          ), // Padding
          Padding(
            padding: EdgeInsets.all(8),
            child: SampleObject(
              title: 'fontSize',
              object: textStyle.fontSize,
            ), // SampleObject
          ), // Padding
          Padding(
            padding: EdgeInsets.all(8),
            child: SampleObject(
              title: 'fontStyle',
              object: textStyle.fontStyle,
            ), // SampleObject
          ), // Padding
          Padding(
            padding: EdgeInsets.all(8),
            child: SampleObject(
              title: 'fontVariations',
              object: textStyle.fontVariations,
            ), // SampleObject
          ), // Padding
          Padding(
            padding: EdgeInsets.all(8),
            child: SampleObject(
              title: 'fontWeight',
              object: textStyle.fontWeight,
            ), // SampleObject
          ), // Padding
          Padding(
            padding: EdgeInsets.all(8),
            child: SampleObject(
              title: 'foreground',
              object: textStyle.foreground,
            ), // SampleObject
          ), // Padding
          Padding(
            padding: EdgeInsets.all(8),
            child: SampleObject(
              title: 'height',
              object: textStyle.height,
            ), // SampleObject
          ), // Padding
          Padding(
            padding: EdgeInsets.all(8),
            child: SampleObject(
              title: 'inherit',
              object: textStyle.inherit,
            ), // SampleObject
          ), // Padding
          Padding(
            padding: EdgeInsets.all(8),
            child: SampleObject(
              title: 'leadingDistribution',
              object: textStyle.leadingDistribution,
            ), // SampleObject
          ), // Padding
          Padding(
            padding: EdgeInsets.all(8),
            child: SampleObject(
              title: 'letterSpacing',
              object: textStyle.letterSpacing,
            ), // SampleObject
          ), // Padding
          Padding(
            padding: EdgeInsets.all(8),
            child: SampleObject(
              title: 'locale',
              object: textStyle.locale,
            ), // SampleObject
          ), // Padding
          Padding(
            padding: EdgeInsets.all(8),
            child: SampleObject(
              title: 'overflow',
              object: textStyle.overflow,
            ), // SampleObject
          ), // Padding
          Padding(
            padding: EdgeInsets.all(8),
            child: SampleObject(
              title: 'shadows',
              object: textStyle.shadows,
            ), // SampleObject
          ), // Padding
          Padding(
            padding: EdgeInsets.all(8),
            child: SampleObject(
              title: 'textBaseline',
              object: textStyle.textBaseline,
            ), // SampleObject
          ), // Padding
          Padding(
            padding: EdgeInsets.all(8),
            child: SampleObject(
              title: 'wordSpacing',
              object: textStyle.wordSpacing,
            ), // SampleObject
          ), // Padding
        ],
      ), // ListView
    );
  }
}
