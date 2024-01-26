import 'package:flutter/material.dart';

import 'sample_object.dart';

class ButtonThemePage extends StatelessWidget {

  final ButtonThemeData theme;

  const ButtonThemePage({
    super.key,
    required this.theme,
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
              title: 'alignedDropdown',
              object: theme.alignedDropdown,
            ), // SampleObject
          ), // Padding
          Padding(
            padding: EdgeInsets.all(8),
            child: SampleObject(
              title: 'colorScheme',
              object: theme.colorScheme,
            ), // SampleObject
          ), // Padding
          Padding(
            padding: EdgeInsets.all(8),
            child: SampleObject(
              title: 'constraints',
              object: theme.constraints,
            ), // SampleObject
          ), // Padding
          Padding(
            padding: EdgeInsets.all(8),
            child: SampleObject(
              title: 'height',
              object: theme.height,
            ), // SampleObject
          ), // Padding
          Padding(
            padding: EdgeInsets.all(8),
            child: SampleObject(
              title: 'layoutBehavior',
              object: theme.layoutBehavior,
            ), // SampleObject
          ), // Padding
          Padding(
            padding: EdgeInsets.all(8),
            child: SampleObject(
              title: 'minWidth',
              object: theme.minWidth,
            ), // SampleObject
          ), // Padding
          Padding(
            padding: EdgeInsets.all(8),
            child: SampleObject(
              title: 'padding',
              object: theme.padding,
            ), // SampleObject
          ), // Padding
          Padding(
            padding: EdgeInsets.all(8),
            child: SampleObject(
              title: 'shape',
              object: theme.shape,
            ), // SampleObject
          ), // Padding
          Padding(
            padding: EdgeInsets.all(8),
            child: SampleObject(
              title: 'textTheme',
              object: theme.textTheme,
            ), // SampleObject
          ), // Padding
        ],
      ), // ListView
    );
  }

}