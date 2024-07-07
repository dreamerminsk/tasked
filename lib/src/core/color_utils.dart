import 'package:flutter/material.dart';

class ColorUtils {
//function getContrastYIQ(hexcolor){
  //var r = parseInt(hexcolor.substr(0,2),16);
  //var g = parseInt(hexcolor.substr(2,2),16);
  //var b = parseInt(hexcolor.substr(4,2),16);
  //var yiq = ((r*299)+(g*587)+(b*114))/1000;
  //return (yiq >= 128) ? 'black' : 'white';
//}

  static Color contrastColor(Color color) {
    final yiq = (299 * color.red + 587 * color.green + 114 * color.blue) / 1000;
    return yiq >= 128 ? Colors.black : Colors.white;
  }

  static Color contrastThemeColor(Color color) {
    final Brightness brightness = ThemeData.estimateBrightnessForColor(color);
    return brightness == Brightness.dark ? Colors.white : Colors.black;
  }
}
