import 'package:flutter/material.dart';


import '../../../core/colors.dart';
import '../../../core/color_utils.dart';



class SeedColorNotifier extends ChangeNotifier{

_colorIdx = 0;
_shadeIdx = 0;


      NamedMaterialColor get seedColor => NamedColors.primaries[_colorIdx];
      NamedColor get shadeColor => NamedColors.primaries[_colorIdx].shades[_shadeIdx];

void nextColor() {
_colorIdx = (_colorIdx + 1) % NamedColors.primaries.length;
_shadeIdx = _shadeIdx % seedColor.shades.length;
notifyListeners();
}

void prevColor() {
const colors = NamedColors.primaries.length;
_colorIdx = (_colorIdx +colors- 1) % colors;
_shadeIdx = _shadeIdx % seedColor.shades.length;
notifyListeners();
}


void nextShade() {
_shadeIdx = (_shadeIdx + 1) % seedColor.shades.length;
notifyListeners();
}

void prevShade() {
const shades = seedColor.shades.length;
_colorIdx = (_colorIdx +shades- 1) % shades;
notifyListeners();
}

}