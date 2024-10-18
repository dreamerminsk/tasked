import 'package:flutter/material.dart' hide ColorProperty;

import 'color_utils.dart';
import 'properties.dart';

class NamedTextTheme {
  const NamedTextTheme({required this.textTheme});

  final TextTheme textTheme;

  factory NamedTextTheme.of(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return NamedTextTheme(textTheme: textTheme);
  }

     NamedTextStyle get primary => NamedTextStyle('primary', textTheme.primary);

  List<ColorProperty> get values => <ColorProperty>[
      ];

  List<(ColorProperty, ColorProperty)> get pairs =>
      <(ColorProperty, ColorProperty)>[
      ];
}
