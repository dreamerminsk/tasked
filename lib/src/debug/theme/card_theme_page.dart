import 'package:flutter/material.dart';

import 'sample_object.dart';

class CardThemePage extends StatelessWidget {
  final CardTheme theme;

  const CardThemePage({
    super.key,
    required this.theme,
  });

  @override
  Widget build(context) {
    //final textTheme = Theme.of(context).textTheme;
    //final colorScheme = Theme.of(context).colorScheme;
    final inner = CardTheme.of(context);

    return Scaffold(
      body: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(8),
            child: SampleObject(
              title: 'clipBehavior',
              object: theme.clipBehavior ?? inner.clipBehavior,
            ), // SampleObject
          ), // Padding
          Padding(
            padding: EdgeInsets.all(8),
            child: SampleObject(
              title: 'color',
              object: theme.color ?? inner.color,
            ), // SampleObject
          ), // Padding
          Padding(
            padding: EdgeInsets.all(8),
            child: SampleObject(
              title: 'elevation',
              object: theme.elevation ?? inner.elevation,
            ), // SampleObject
          ), // Padding
          Padding(
            padding: EdgeInsets.all(8),
            child: SampleObject(
              title: 'margin',
              object: theme.margin ?? inner.margin,
            ), // SampleObject
          ), // Padding
          Padding(
            padding: EdgeInsets.all(8),
            child: SampleObject(
              title: 'shadowColor',
              object: theme.shadowColor ?? inner.shadowColor,
            ), // SampleObject
          ), // Padding
          Padding(
            padding: EdgeInsets.all(8),
            child: SampleObject(
              title: 'shape',
              object: theme.shape ?? inner.shape,
            ), // SampleObject
          ), // Padding
          Padding(
            padding: EdgeInsets.all(8),
            child: SampleObject(
              title: 'surfaceTintColor',
              object: theme.surfaceTintColor ?? inner.surfaceTintColor,
            ), // SampleObject
          ), // Padding
        ],
      ), // ListView
    );
  }
}
