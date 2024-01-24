import 'package:flutter/material.dart';

import 'sample_object.dart';

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
              object: textStyle.alpha,
            ), // SampleObject
          ), // Padding
          Padding(
            padding: EdgeInsets.all(8),
            child: SampleObject(
              title: 'blue',
              object: textStyle.blue,
            ), // SampleObject
          ), // Padding
        ],
      ), // ListView
    );
  }

}