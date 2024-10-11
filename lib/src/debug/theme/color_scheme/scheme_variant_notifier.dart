import 'package:flutter/material.dart';

import '../../../core/colors.dart';

class SchemeVariantNotifier extends ChangeNotifier {
  int _prevVariantIdx = 0;

  int _variantIdx = 1;

  int _nextVariantIdx = 2;

  final variantCount = DynamicSchemeVariant.values.length;

  NamedMaterialColor get prevColor => NamedColors.primaries[_prevColorIdx];
  NamedColor get prevShade => color.shades[_prevShadeIdx];

  NamedMaterialColor get color => NamedColors.primaries[_colorIdx];
  NamedColor get shade => color.shades[_shadeIdx];

  NamedMaterialColor get nextColor => NamedColors.primaries[_nextColorIdx];
  NamedColor get nextShade => color.shades[_nextShadeIdx];

  void incVariantIdx() {
    _prevVariantIdx = _variantIdx;
    _variantIdx = _nextVariantIdx;
    _nextVariantIdx = nextVariantIdx();

    notifyListeners();
  }

  int nextVariantIdx() {
    return (_variantIdx + 1) % variantCount;
  }

  void decVariantIdx() {
    _nextVariantIdx = _variantIdx;
    _variantIdx = _prevVariantIdx;
    _prevVariantIdx = prevVariantIdx();

    notifyListeners();
  }

  int prevVariantIdx() {
    return (_vvariantIdx - 1 + variantCount) % variantCount;
  }
}
