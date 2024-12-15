import 'package:flutter/material.dart';

class ThemeNotifier extends ChangeNotifier {
  ColorSchemeSeed _seedData;

  ThemeNotifier(this._seedData);

  factory ThemeNotifier.random() {
    return ThemeNotifier(
      ColorSchemeSeed.random()
    );
  }

  ColorSchemeSeed get seed => _seedData;

  ThemeData get theme => ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: _seedData.seedColor,
          dynamicSchemeVariant: _seedData.dynamicSchemeVariant,
          contrastLevel: _seedData.contrastLevel,
        ),
      );

  void randomise() {
      _seedData = ColorSchemeSeed.random();
      notifyListeners();
  }
}