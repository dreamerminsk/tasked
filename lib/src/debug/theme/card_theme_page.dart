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

    return Scaffold(
      body: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(8),
            child: SampleObject(
              title: 'alignedDropdown',
              object: theme,
            ), // SampleObject
          ), // Padding
        ],
      ), // ListView
    );
  }

}