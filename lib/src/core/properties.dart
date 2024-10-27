import 'package:flutter/material.dart' hide ColorProperty;

class NamedValue<T> {
  NamedValue(this.name, this.value);

  final String name;
  final T? value;
}

class ColorProperty extends NamedValue<Color> {
  ColorProperty(super.name, super.value);
}

class NamedTextStyle extends NamedValue<TextStyle> {
  NamedTextStyle(super.name, super.value);
}
