import 'package:flutter/material.dart';

import 'sample_object.dart';
import 'sample_color_alpha.dart';
import 'sample_color_red.dart';
import 'sample_color_green.dart';
import 'sample_color_blue.dart';

class ColorPage extends StatelessWidget {
  final Color color;

  const ColorPage({
    super.key,
    required this.color,
  });

  @override
  Widget build(context) {
    //final textTheme = Theme.of(context).textTheme;
    //final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      body: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(8),
            child: SampleObject(
              title: 'alpha',
              object: color.alpha,
            ), // SampleObject
          ), // Padding
          Padding(
            padding: EdgeInsets.all(8),
            child: SampleObject(
              title: 'red',
              object: color.red,
            ), // SampleObject
          ), // Padding
          Padding(
            padding: EdgeInsets.all(8),
            child: SampleObject(
              title: 'green',
              object: color.green,
            ), // SampleObject
          ), // Padding
          Padding(
            padding: EdgeInsets.all(8),
            child: SampleObject(
              title: 'blue',
              object: color.blue,
            ), // SampleObject
          ), // Padding
          Padding(
            padding: EdgeInsets.all(8),
            child: SampleObject(
              title: 'value',
              object: color.value,
            ), // SampleObject
          ), // Padding
        ],
      ), // ListView
    );
  }
}
