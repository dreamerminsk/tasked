import 'package:flutter/material.dart' hide ColorProperty;

class NamedProperty<T> {
  NamedProperty(this.name, this.value);

  final String name;
  final T? value;
}

class ColorProperty extends NamedProperty<Color> {
  ColorProperty(super.name, super.value);
}

class NamedTextStyle extends NamedProrerty<TextStyle> {
  NamedTextStyle(super.name, super.value);
}
