import 'package:flutter/material.dart';

class NamedColor {
  final String name;
  final Color color;

  const NamedColor({required this.name, required this.color});
}

class NamedMaterialColor {
  final String name;
  final MaterialColor primary;

  const NamedMaterialColor({required this.name, required this.primary});

  NamedColor get shade50 => NamedColor(
        name: '$name[50]',
        color: primary[50]!,
      );

  NamedColor get shade100 => NamedColor(
        name: '$name[100]',
        color: primary[100]!,
      );

  NamedColor get shade200 => NamedColor(
        name: '$name[200]',
        color: primary[200]!,
      );

  NamedColor get shade300 => NamedColor(
        name: '$name[300]',
        color: primary[300]!,
      );

  NamedColor get shade400 => NamedColor(
        name: '$name[400]',
        color: primary[400]!,
      );

  NamedColor get shade500 => NamedColor(
        name: '$name[500]',
        color: primary[500]!,
      );

  NamedColor get shade600 => NamedColor(
        name: '$name[600]',
        color: primary[600]!,
      );

  NamedColor get shade700 => NamedColor(
        name: '$name[700]',
        color: primary[700]!,
      );

  NamedColor get shade800 => NamedColor(
        name: '$name[800]',
        color: primary[800]!,
      );

  NamedColor get shade900 => NamedColor(
        name: '$name[900]',
        color: primary[900]!,
      );

  final List<NamedColor> shades = <NamedColor>[
    shade50,
    shade100,
    shade200,
    shade300,
    shade400,
    shade500,
    shade600,
    shade700,
    shade800,
    shade900,
  ];
}

class NamedAccentColor {
  final String name;
  final MaterialAccentColor accent;

  const NamedAccentColor({required this.name, required this.accent});

  NamedColor get shade50 => NamedColor(
        name: '$name[50]',
        color: accent[50]!,
      );

  NamedColor get shade100 => NamedColor(
        name: '$name[100]',
        color: accent[100]!,
      );

  NamedColor get shade200 => NamedColor(
        name: '$name[200]',
        color: accent[200]!,
      );

  NamedColor get shade400 => NamedColor(
        name: '$name[400]',
        color: accent[400]!,
      );

  NamedColor get shade700 => NamedColor(
        name: '$name[700]',
        color: accent[700]!,
      );

  final List<NamedColor> shades = <NamedColor>[
    shade50,
    shade100,
    shade200,
    shade400,
    shade700,
  ];
}

abstract final class NamedColors {
  static const NamedColor transparent = NamedColor(
    name: 'transparent',
    color: Color(0x00000000),
  );

  static const NamedColor black =
      NamedColor(name: 'black', color: Color(0xFF000000));

  static const NamedColor black87 =
      NamedColor(name: 'black87', color: Color(0xDD000000));

  static const NamedColor black54 =
      NamedColor(name: 'black54', color: Color(0x8A000000));

  static const NamedColor black45 =
      NamedColor(name: 'black45', color: Color(0x73000000));

  static const NamedColor black38 =
      NamedColor(name: 'black38', color: Color(0x61000000));

  static const NamedColor black26 =
      NamedColor(name: 'black26', color: Color(0x42000000));

  static const NamedColor black12 =
      NamedColor(name: 'black12', color: Color(0x1F000000));

  static const NamedColor white =
      NamedColor(name: 'white', color: Color(0xFFFFFFFF));

  static const NamedColor white70 =
      NamedColor(name: 'white70', color: Color(0xB3FFFFFF));

  static const NamedColor white60 =
      NamedColor(name: 'white60', color: Color(0x99FFFFFF));

  static const NamedColor white54 =
      NamedColor(name: 'white54', color: Color(0x8AFFFFFF));

  static const NamedColor white38 =
      NamedColor(name: 'white38', color: Color(0x62FFFFFF));

  static const NamedColor white30 =
      NamedColor(name: 'white30', color: Color(0x4DFFFFFF));

  static const NamedColor white24 =
      NamedColor(name: 'white24', color: Color(0x3DFFFFFF));

  static const NamedColor white12 =
      NamedColor(name: 'white12', color: Color(0x1FFFFFFF));

  static const NamedColor white10 =
      NamedColor(name: 'white10', color: Color(0x1AFFFFFF));

  static const NamedMaterialColor red = NamedMaterialColor(
    name: 'red',
    primary: Colors.red,
  );

  static const NamedAccentColor redAccent = NamedAccentColor(
    name: 'redAccent',
    accent: Colors.redAccent,
  );

  static const NamedMaterialColor pink = NamedMaterialColor(
    name: 'pink',
    primary: Colors.pink,
  );

  static const NamedAccentColor pinkAccent = NamedAccentColor(
    name: 'pinkAccent',
    accent: Colors.pinkAccent,
  );

  static const NamedMaterialColor purple = NamedMaterialColor(
    name: 'purple',
    primary: Colors.purple,
  );

  static const NamedAccentColor purpleAccent = NamedAccentColor(
    name: 'purpleAccent',
    accent: Colors.purpleAccent,
  );

  static const NamedMaterialColor deepPurple = NamedMaterialColor(
    name: 'deepPurple',
    primary: Colors.deepPurple,
  );

  static const NamedAccentColor deepPurpleAccent = NamedAccentColor(
    name: 'deepPurpleAccent',
    accent: Colors.deepPurpleAccent,
  );

  static const NamedMaterialColor indigo = NamedMaterialColor(
    name: 'indigo',
    primary: Colors.indigo,
  );

  static const NamedAccentColor indigoAccent = NamedAccentColor(
    name: 'indigoAccent',
    accent: Colors.indigoAccent,
  );

  static const NamedMaterialColor blue = NamedMaterialColor(
    name: 'blue',
    primary: Colors.blue,
  );

  static const NamedAccentColor blueAccent = NamedAccentColor(
    name: 'blueAccent',
    accent: Colors.blueAccent,
  );

  static const NamedMaterialColor lightBlue = NamedMaterialColor(
    name: 'lightBlue',
    primary: Colors.lightBlue,
  );

  static const NamedAccentColor lightBlueAccent = NamedAccentColor(
    name: 'lightBlueAccent',
    accent: Colors.lightBlueAccent,
  );

  static const NamedMaterialColor cyan = NamedMaterialColor(
    name: 'cyan',
    primary: Colors.cyan,
  );

  static const NamedAccentColor cyanAccent = NamedAccentColor(
    name: 'cyanAccent',
    accent: Colors.cyanAccent,
  );

  static const NamedMaterialColor teal = NamedMaterialColor(
    name: 'teal',
    primary: Colors.teal,
  );

  static const NamedAccentColor tealAccent = NamedAccentColor(
    name: 'tealAccent',
    accent: Colors.tealAccent,
  );

  static const NamedMaterialColor green = NamedMaterialColor(
    name: 'green',
    primary: Colors.green,
  );

  static const NamedAccentColor greenAccent = NamedAccentColor(
    name: 'greenAccent',
    accent: Colors.greenAccent,
  );

  static const NamedMaterialColor lightGreen = NamedMaterialColor(
    name: 'lightGreen',
    primary: Colors.lightGreen,
  );

  static const NamedAccentColor lightGreenAccent = NamedAccentColor(
    name: 'lightGreenAccent',
    accent: Colors.lightGreenAccent,
  );

  static const NamedMaterialColor lime = NamedMaterialColor(
    name: 'lime',
    primary: Colors.lime,
  );

  static const NamedAccentColor limeAccent = NamedAccentColor(
    name: 'limeAccent',
    accent: Colors.limeAccent,
  );

  static const NamedMaterialColor yellow = NamedMaterialColor(
    name: 'yellow',
    primary: Colors.yellow,
  );

  static const NamedAccentColor yellowAccent = NamedAccentColor(
    name: 'yellowAccent',
    accent: Colors.yellowAccent,
  );

  static const NamedMaterialColor amber = NamedMaterialColor(
    name: 'amber',
    primary: Colors.amber,
  );

  static const NamedAccentColor amberAccent = NamedAccentColor(
    name: 'amberAccent',
    accent: Colors.amberAccent,
  );

  static const NamedMaterialColor orange = NamedMaterialColor(
    name: 'orange',
    primary: Colors.orange,
  );

  static const NamedAccentColor orangeAccent = NamedAccentColor(
    name: 'orangeAccent',
    accent: Colors.orangeAccent,
  );

  static const NamedMaterialColor deepOrange = NamedMaterialColor(
    name: 'deepOrange',
    primary: Colors.deepOrange,
  );

  static const NamedAccentColor deepOrangeAccent = NamedAccentColor(
    name: 'deepOrangeAccent',
    accent: Colors.deepOrangeAccent,
  );

  static const NamedMaterialColor brown = NamedMaterialColor(
    name: 'brown',
    primary: Colors.brown,
  );

  static const NamedMaterialColor grey = NamedMaterialColor(
    name: 'grey',
    primary: Colors.grey,
  );

  static const NamedMaterialColor blueGrey = NamedMaterialColor(
    name: 'blueGrey',
    primary: Colors.blueGrey,
  );

  static const List<NamedMaterialColor> primaries = <NamedMaterialColor>[
    red,
    pink,
    purple,
    deepPurple,
    indigo,
    blue,
    lightBlue,
    cyan,
    teal,
    green,
    lightGreen,
    lime,
    yellow,
    amber,
    orange,
    deepOrange,
    brown,
    grey,
    blueGrey,
  ];

  static const List<NamedAccentColor> accents = <NamedAccentColor>[
    redAccent,
    pinkAccent,
    purpleAccent,
    deepPurpleAccent,
    indigoAccent,
    blueAccent,
    lightBlueAccent,
    cyanAccent,
    tealAccent,
    greenAccent,
    lightGreenAccent,
    limeAccent,
    yellowAccent,
    amberAccent,
    orangeAccent,
    deepOrangeAccent,
  ];
}

class NamedColorScheme {
    required this.primary,
    required this.onPrimary,
    Color? primaryContainer,
    Color? onPrimaryContainer,
    Color? primaryFixed,
    Color? primaryFixedDim,
    Color? onPrimaryFixed,
    Color? onPrimaryFixedVariant,
    required this.secondary,
    required this.onSecondary,
    Color? secondaryContainer,
    Color? onSecondaryContainer,
    Color? secondaryFixed,
    Color? secondaryFixedDim,
    Color? onSecondaryFixed,
    Color? onSecondaryFixedVariant,
    Color? tertiary,
    Color? onTertiary,
    Color? tertiaryContainer,
    Color? onTertiaryContainer,
    Color? tertiaryFixed,
    Color? tertiaryFixedDim,
    Color? onTertiaryFixed,
    Color? onTertiaryFixedVariant,
    required this.error,
    required this.onError,
    Color? errorContainer,
    Color? onErrorContainer,
    required this.surface,
    required this.onSurface,
    Color? surfaceDim,
    Color? surfaceBright,
    Color? surfaceContainerLowest,
    Color? surfaceContainerLow,
    Color? surfaceContainer,
    Color? surfaceContainerHigh,
    Color? surfaceContainerHighest,
    Color? onSurfaceVariant,
    Color? outline,
    Color? outlineVariant,
    Color? shadow,
    Color? scrim,
    Color? inverseSurface,
    Color? onInverseSurface,
    Color? inversePrimary,
    Color? surfaceTint,
}

class NamedProperty<T> {



}

class ColorProperty extends NamedProperty<Color> {
  ColorProperty(
    super.name,
    super.value);
}
