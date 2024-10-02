import 'package:flutter/material.dart';

import '../../../core/colors.dart';
import '../../../core/color_utils.dart';

class SeedColorNotifier extends ChangeNotifier {
  int _colorIdx = 0;
  int _shadeIdx = 0;

  NamedMaterialColor get seedColor => NamedColors.primaries[_colorIdx];
  NamedColor get shadeColor => seedColor.shades[_shadeIdx];

  NamedMaterialColor get nextSeedColor =>
      NamedColors.primaries[(_colorIdx + 1) % NamedColors.primaries.length];
  NamedColor get nextShadeColor =>
      seedColor.shades[(_shadeIdx + 1) % seedColor.shades.length];

  NamedMaterialColor get prevSeedColor =>
      NamedColors.primaries[(_colorIdx - 1 + NamedColors.primaries.length) % NamedColors.primaries.length];
  NamedColor get prevShadeColor =>
      seedColor.shades[(_shadeIdx - 1 + seedColor.shades.length) % seedColor.shades.length];

  void nextColor() {
    _colorIdx = (_colorIdx + 1) % NamedColors.primaries.length;
    _shadeIdx = 0; // Reset shade index when color changes
    notifyListeners();
  }

  void prevColor() {
    _colorIdx = (_colorIdx - 1 + NamedColors.primaries.length) % NamedColors.primaries.length;
    _shadeIdx = 0; // Reset shade index when color changes
    notifyListeners();
  }

  void nextShade() {
    _shadeIdx = (_shadeIdx + 1) % seedColor.shades.length;
    notifyListeners();
  }

  void prevShade() {
    _shadeIdx = (_shadeIdx - 1 + seedColor.shades.length) % seedColor.shades.length;
    notifyListeners();
  }
}