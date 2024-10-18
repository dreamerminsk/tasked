import 'package:flutter/material.dart';

import 'properties.dart';

class NamedTextTheme {
  const NamedTextTheme({required this.textTheme});

  final TextTheme textTheme;

  factory NamedTextTheme.of(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return NamedTextTheme(textTheme: textTheme);
  }

     NamedTextStyle get displayLarge => NamedTextStyle('displayLarge', textTheme.displayLarge);

NamedTextStyle get displayMedium => NamedTextStyle('displayMedium', textTheme.displayMedium);

NamedTextStyle get displaySmall => NamedTextStyle('displaySmall', textTheme.displaySmall);

NamedTextStyle get headlineLarge => NamedTextStyle('headlineLarge', textTheme.headlineLarge);

NamedTextStyle get headlineMedium => NamedTextStyle('headlineMedium', textTheme.headlineMedium);

NamedTextStyle get headlineSmall => NamedTextStyle('headlineSmall', textTheme.headlineSmall);

NamedTextStyle get titleLarge => NamedTextStyle('titleLarge', textTheme.titleLarge);

NamedTextStyle get titleMedium => NamedTextStyle('titleMedium', textTheme.titleMedium);

NamedTextStyle get titleSmall => NamedTextStyle('titleSmall', textTheme.titleSmall);

NamedTextStyle get bodyLarge => NamedTextStyle('bodyLarge', textTheme.bodyLarge);

NamedTextStyle get bodyMedium => NamedTextStyle('bodyMedium', textTheme.bodyMedium);

NamedTextStyle get bodySmall => NamedTextStyle('bodySmall', textTheme.bodySmall);

NamedTextStyle get labelLarge => NamedTextStyle('labelLarge', textTheme.labelLarge);

NamedTextStyle get labelMedium => NamedTextStyle('labelMedium', textTheme.labelMedium);

NamedTextStyle get labelSmall => NamedTextStyle('labelSmall', textTheme.labelSmall);

  List<ColorProperty> get values => <NamedTextStyle>[
displayLarge,
displayMedium,
displaySmall,
headlineLarge,
headlineMedium,
headlineSmall,
titleLarge,
titleMedium,
titleSmall,
bodyLarge,
bodyMedium,
bodySmall,
labelLarge,
labelMedium,
labelSmall,
      ];
}
