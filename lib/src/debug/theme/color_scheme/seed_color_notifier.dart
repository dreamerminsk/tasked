import 'package:flutter/material.dart';

import '../../../core/colors.dart';
import '../../../core/color_utils.dart';

class SeedColorNotifier extends ChangeNotifier {
  int _colorIdx = 0;
  int _shadeIdx = 0;

  int _prevColorIdx = 0;
  int _prevShadeIdx = 0;

  int _nextColorIdx = 0;
  int _nextShadeIdx = 0;

  final colorCount = NamedColors.primaries.length;

  NamedMaterialColor get color => NamedColors.primaries[_colorIdx];
  NamedColor get shade => color.shades[_shadeIdx];

  NamedMaterialColor get nextColor =>
      NamedColors.primaries[nextColorIdx()];
  NamedColor get nextShade =>
      color.shades[nextShadeIdx()];

  NamedMaterialColor get prevColor =>
      NamedColors.primaries[prevColorIdx()];
  NamedColor get prevShade =>
      color.shades[prevShadeIdx()];

  void incColorIdx() {
    _colorIdx = nextColorIdx();
    _shadeIdx = 0; // Reset shade index when color changes
    notifyListeners();
  }

  int nextColorIdx() {
return (_colorIdx + 1) % colorCount;
}

  void decColorIdx() {
    _colorIdx = prevColorIdx() ;
    _shadeIdx = 0; // Reset shade index when color changes
    notifyListeners();
  }

int prevColorIdx() {
return (_colorIdx - 1 + colorCount) % colorCount;
}

  void incShadeIdx() {
    _shadeIdx = nextShadeIdx();
    notifyListeners();
  }

void nextShadeIdx() {
    return (_shadeIdx + 1) % color.shades.length;
  }

  void decShadeIdx() {
    _shadeIdx = prevShadeIdx();
    notifyListeners();
  }

void prevShadeIdx() {
    return (_shadeIdx - 1 + color.shades.length) % color.shades.length;
  }
}