import 'package:flutter/material.dart' hide ColorProperty;

class NamedValue<T> {
  NamedValue(this.name, this.value);

  final String name;
  final T? value;
}