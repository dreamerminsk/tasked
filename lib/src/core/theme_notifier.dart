import 'package:flutter/material.dart';

class ThemeNotifier extends ChangeNotifier {
  ColorSchemeSeed _seedData;

  ThemeNotifier(this._seedData);

  ThemeData get theme => ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: _seedData.seedColor,
          dynamicSchemeVariant: _seedData.dynamicSchemeVariant,
          contrastLevel: _seedData.contrastLevel,
        ),
      );

  void randomise() {
    try {
      _seedData = ColorSchemeSeed.random();
      notifyListeners();
    } catch (e) {
      print('Error randomizing theme: $e');
    }
  }
}