import 'package:flutter/material.dart';

import '../../../core/colors.dart';
import '../../../core/color_utils.dart';

class SeedColorNotifier extends ChangeNotifier {
  int _colorIdx = 0;
  int _shadeIdx = 0;

  NamedMaterialColor get color => NamedColors.primaries[_colorIdx];
  NamedColor get shade => color.shades[_shadeIdx];

  NamedMaterialColor get nextColor =>
      NamedColors.primaries[(_colorIdx + 1) % NamedColors.primaries.length];
  NamedColor get nextShade =>
      color.shades[(_shadeIdx + 1) % color.shades.length];

  NamedMaterialColor get prevColor =>
      NamedColors.primaries[(_colorIdx - 1 + NamedColors.primaries.length) % NamedColors.primaries.length];
  NamedColor get prevShade =>
      color.shades[(_shadeIdx - 1 + color.shades.length) % color.shades.length];

  void incColorIdx() {
    _colorIdx = (_colorIdx + 1) % NamedColors.primaries.length;
    _shadeIdx = 0; // Reset shade index when color changes
    notifyListeners();
  }

  void decColorIdx() {
    _colorIdx = (_colorIdx - 1 + NamedColors.primaries.length) % NamedColors.primaries.length;
    _shadeIdx = 0; // Reset shade index when color changes
    notifyListeners();
  }

  void incShadeIdx() {
    _shadeIdx = (_shadeIdx + 1) % seedColor.shades.length;
    notifyListeners();
  }

  void decShadeIdx() {
    _shadeIdx = (_shadeIdx - 1 + seedColor.shades.length) % seedColor.shades.length;
    notifyListeners();
  }
}