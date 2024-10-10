import 'package:flutter/material.dart';

class NamedColor {
  final String name;
  final Color color;

  const NamedColor({required this.name, required this.color});

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is NamedColor && other.name == name && other.color == color;
  }

  @override
  int get hashCode => name.hashCode ^ color.hashCode;
}

class NamedColorSwatch {
  final String name;

  final ColorSwatch<int> colorSwatch;

  const NamedColorSwatch({required this.name, required this.colorSwatch});
}

class NamedMaterialColor extends NamedColorSwatch {
  const NamedMaterialColor({required super.name, required super.colorSwatch});

  NamedColor get shade50 => NamedColor(
        name: '$name[50]',
        color: colorSwatch[50]!,
      );

  NamedColor get shade100 => NamedColor(
        name: '$name[100]',
        color: colorSwatch[100]!,
      );

  NamedColor get shade200 => NamedColor(
        name: '$name[200]',
        color: colorSwatch[200]!,
      );

  NamedColor get shade300 => NamedColor(
        name: '$name[300]',
        color: colorSwatch[300]!,
      );

  NamedColor get shade400 => NamedColor(
        name: '$name[400]',
        color: colorSwatch[400]!,
      );

  NamedColor get shade500 => NamedColor(
        name: '$name[500]',
        color: colorSwatch[500]!,
      );

  NamedColor get shade600 => NamedColor(
        name: '$name[600]',
        color: colorSwatch[600]!,
      );

  NamedColor get shade700 => NamedColor(
        name: '$name[700]',
        color: colorSwatch[700]!,
      );

  NamedColor get shade800 => NamedColor(
        name: '$name[800]',
        color: colorSwatch[800]!,
      );

  NamedColor get shade900 => NamedColor(
        name: '$name[900]',
        color: colorSwatch[900]!,
      );

  List<NamedColor> get shades => [
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

class NamedAccentColor extends NamedColorSwatch {
  const NamedAccentColor({required super.name, required super.colorSwatch});

  NamedColor get shade50 => NamedColor(
        name: '$name[50]',
        color: colorSwatch[50]!,
      );

  NamedColor get shade100 => NamedColor(
        name: '$name[100]',
        color: colorSwatch[100]!,
      );

  NamedColor get shade200 => NamedColor(
        name: '$name[200]',
        color: colorSwatch[200]!,
      );

  NamedColor get shade400 => NamedColor(
        name: '$name[400]',
        color: colorSwatch[400]!,
      );

  NamedColor get shade700 => NamedColor(
        name: '$name[700]',
        color: colorSwatch[700]!,
      );

  List<NamedColor> get shades => [
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
    colorSwatch: Colors.red,
  );

  static const NamedAccentColor redAccent = NamedAccentColor(
    name: 'redAccent',
    colorSwatch: Colors.redAccent,
  );

  static const NamedMaterialColor pink = NamedMaterialColor(
    name: 'pink',
    colorSwatch: Colors.pink,
  );

  static const NamedAccentColor pinkAccent = NamedAccentColor(
    name: 'pinkAccent',
    colorSwatch: Colors.pinkAccent,
  );

  static const NamedMaterialColor purple = NamedMaterialColor(
    name: 'purple',
    colorSwatch: Colors.purple,
  );

  static const NamedAccentColor purpleAccent = NamedAccentColor(
    name: 'purpleAccent',
    colorSwatch: Colors.purpleAccent,
  );

  static const NamedMaterialColor deepPurple = NamedMaterialColor(
    name: 'deepPurple',
    colorSwatch: Colors.deepPurple,
  );

  static const NamedAccentColor deepPurpleAccent = NamedAccentColor(
    name: 'deepPurpleAccent',
    colorSwatch: Colors.deepPurpleAccent,
  );

  static const NamedMaterialColor indigo = NamedMaterialColor(
    name: 'indigo',
    colorSwatch: Colors.indigo,
  );

  static const NamedAccentColor indigoAccent = NamedAccentColor(
    name: 'indigoAccent',
    colorSwatch: Colors.indigoAccent,
  );

  static const NamedMaterialColor blue = NamedMaterialColor(
    name: 'blue',
    colorSwatch: Colors.blue,
  );

  static const NamedAccentColor blueAccent = NamedAccentColor(
    name: 'blueAccent',
    colorSwatch: Colors.blueAccent,
  );

  static const NamedMaterialColor lightBlue = NamedMaterialColor(
    name: 'lightBlue',
    colorSwatch: Colors.lightBlue,
  );

  static const NamedAccentColor lightBlueAccent = NamedAccentColor(
    name: 'lightBlueAccent',
    colorSwatch: Colors.lightBlueAccent,
  );

  static const NamedMaterialColor cyan = NamedMaterialColor(
    name: 'cyan',
    colorSwatch: Colors.cyan,
  );

  static const NamedAccentColor cyanAccent = NamedAccentColor(
    name: 'cyanAccent',
    colorSwatch: Colors.cyanAccent,
  );

  static const NamedMaterialColor teal = NamedMaterialColor(
    name: 'teal',
    colorSwatch: Colors.teal,
  );

  static const NamedAccentColor tealAccent = NamedAccentColor(
    name: 'tealAccent',
    colorSwatch: Colors.tealAccent,
  );

  static const NamedMaterialColor green = NamedMaterialColor(
    name: 'green',
    colorSwatch: Colors.green,
  );

  static const NamedAccentColor greenAccent = NamedAccentColor(
    name: 'greenAccent',
    colorSwatch: Colors.greenAccent,
  );

  static const NamedMaterialColor lightGreen = NamedMaterialColor(
    name: 'lightGreen',
    colorSwatch: Colors.lightGreen,
  );

  static const NamedAccentColor lightGreenAccent = NamedAccentColor(
    name: 'lightGreenAccent',
    colorSwatch: Colors.lightGreenAccent,
  );

  static const NamedMaterialColor lime = NamedMaterialColor(
    name: 'lime',
    colorSwatch: Colors.lime,
  );

  static const NamedAccentColor limeAccent = NamedAccentColor(
    name: 'limeAccent',
    colorSwatch: Colors.limeAccent,
  );

  static const NamedMaterialColor yellow = NamedMaterialColor(
    name: 'yellow',
    colorSwatch: Colors.yellow,
  );

  static const NamedAccentColor yellowAccent = NamedAccentColor(
    name: 'yellowAccent',
    colorSwatch: Colors.yellowAccent,
  );

  static const NamedMaterialColor amber = NamedMaterialColor(
    name: 'amber',
    colorSwatch: Colors.amber,
  );

  static const NamedAccentColor amberAccent = NamedAccentColor(
    name: 'amberAccent',
    colorSwatch: Colors.amberAccent,
  );

  static const NamedMaterialColor orange = NamedMaterialColor(
    name: 'orange',
    colorSwatch: Colors.orange,
  );

  static const NamedAccentColor orangeAccent = NamedAccentColor(
    name: 'orangeAccent',
    colorSwatch: Colors.orangeAccent,
  );

  static const NamedMaterialColor deepOrange = NamedMaterialColor(
    name: 'deepOrange',
    colorSwatch: Colors.deepOrange,
  );

  static const NamedAccentColor deepOrangeAccent = NamedAccentColor(
    name: 'deepOrangeAccent',
    colorSwatch: Colors.deepOrangeAccent,
  );

  static const NamedMaterialColor brown = NamedMaterialColor(
    name: 'brown',
    colorSwatch: Colors.brown,
  );

  static const NamedMaterialColor grey = NamedMaterialColor(
    name: 'grey',
    colorSwatch: Colors.grey,
  );

  static const NamedMaterialColor blueGrey = NamedMaterialColor(
    name: 'blueGrey',
    colorSwatch: Colors.blueGrey,
  );

  static const List<NamedMaterialColor> primaries = <NamedMaterialColor>[
    pink,
    red,
    deepOrange,
    orange,
    amber,
    yellow,
    lime,
    lightGreen,
    green,
    teal,
    cyan,
    lightBlue,
    blue,
    indigo,
    purple,
    deepPurple,
    blueGrey,
    brown,
    grey,
  ];

  static const List<NamedAccentColor> accents = <NamedAccentColor>[
    pinkAccent,
    redAccent,
    deepOrangeAccent,
    orangeAccent,
    amberAccent,
    yellowAccent,
    limeAccent,
    lightGreenAccent,
    greenAccent,
    tealAccent,
    cyanAccent,
    lightBlueAccent,
    blueAccent,
    indigoAccent,
    purpleAccent,
    deepPurpleAccent,
  ];

  static const List<NamedColorSwatch> primariesAndAccents = <NamedColorSwatch>[
    pink,
    pinkAccent,
    red,
    redAccent,
    deepOrange,
    deepOrangeAccent,
    orange,
    orangeAccent,
    amber,
    amberAccent,
    yellow,
    yellowAccent,
    lime,
    limeAccent,
    lightGreen,
    lightGreenAccent,
    green,
    greenAccent,
    teal,
    tealAccent,
    cyan,
    cyanAccent,
    lightBlue,
    lightBlueAccent,
    blue,
    blueAccent,
    indigo,
    indigoAccent,
    purple,
    purpleAccent,
    deepPurple,
    deepPurpleAccent,
    blueGrey,
    brown,
    grey,
  ];
}
