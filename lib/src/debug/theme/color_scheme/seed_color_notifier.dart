class SeedColorNotifier extends ChangeNotifier{

_colorIdx = 0;
_shadeIdx = 0;


      NamedMaterialColor get seedColor => NamedColors.primaries[_colorIdx];
      NamedColor get shadeColor => NamedColors.primaries[_colorIdx].shades[_shadeIdx];

void nextColor() {

}

void prevColor() {

}

}