import 'package:flutter/material.dart';

import '../../../core/colors.dart';

class SchemeVariantNotifier extends ChangeNotifier {
  int _variantIdx = 1;

  int _prevVariantIdx = 0;

  int _nextVariantIdx = 2;

  final variantCount = DynamicSchemeVariant.values.length;

  NamedMaterialColor get color => NamedColors.primaries[_colorIdx];
  NamedColor get shade => color.shades[_shadeIdx];

  NamedMaterialColor get nextColor => NamedColors.primaries[_nextColorIdx];
  NamedColor get nextShade => color.shades[_nextShadeIdx];

  NamedMaterialColor get prevColor => NamedColors.primaries[_prevColorIdx];
  NamedColor get prevShade => color.shades[_prevShadeIdx];

  void incVariantIdx() {
    _prevVariantIdx = _variantIdx;
    _variantIdx = _nextVariantIdx;
    _nextVariantIdx = nextVariantIdx();

    notifyListeners();
  }

  int nextVariantIdx() {
    return (_variantIdx + 1) % variantCount;
  }

  void decColorIdx() {
    _nextColorIdx = _colorIdx;
    _colorIdx = _prevColorIdx;
    _prevColorIdx = prevColorIdx();

    _shadeIdx = _shadeIdx % color.shades.length;
    notifyListeners();
  }

  int prevColorIdx() {
    return (_colorIdx - 1 + colorCount) % colorCount;
  }

  void incShadeIdx() {
    _prevShadeIdx = _shadeIdx;
    _shadeIdx = _nextShadeIdx;
    _nextShadeIdx = nextShadeIdx();

    notifyListeners();
  }

  int nextShadeIdx() {
    return (_shadeIdx + 1) % color.shades.length;
  }

  void decShadeIdx() {
    _nextShadeIdx = _shadeIdx;
    _shadeIdx = _prevShadeIdx;
    _prevShadeIdx = prevShadeIdx();

    notifyListeners();
  }

  int prevShadeIdx() {
    return (_shadeIdx - 1 + color.shades.length) % color.shades.length;
  }
}
