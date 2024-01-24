import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'sample_object.dart';

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
        ],
      ), // ListView
    );
  }

}