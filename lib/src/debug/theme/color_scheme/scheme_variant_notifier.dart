import 'package:flutter/material.dart';

class SchemeVariantNotifier extends ChangeNotifier {
  int _prevVariantIdx = 0;

  int _variantIdx = 1;

  int _nextVariantIdx = 2;

  final variantCount = DynamicSchemeVariant.values.length;

  DynamicSchemeVariant get prevVariant => DynamicSchemeVariant.values[_prevVariantIdx];

DynamicSchemeVariant get variant => DynamicSchemeVariant.values[_variantIdx];

DynamicSchemeVariant get nextVariant => DynamicSchemeVariant.values[_nextVariantIdx];

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
    return (_variantIdx - 1 + variantCount) % variantCount;
  }
}
