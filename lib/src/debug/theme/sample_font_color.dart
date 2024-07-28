import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SampleFontColor extends StatelessWidget {
  static const className = 'fontColor';

  final ColorNotifier fontColorNotifier;

final ValueChanged<NamedColor>? onChanged;

  SampleFontColor({
    super.key,
    //required this.initialColor,
    this.onChanged,
  }) {
    fontColorNotifier = ColorNotifier();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    final textStyle = textTheme.titleLarge!.copyWith(
      fontWeight: FontWeight.w700,
      color: colorScheme.onPrimary,
    );

    return Material(
      elevation: 4,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        width: double.infinity,
        height: Get.width / 2 / 1.618, // Golden ratio height
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: colorScheme.primary,
        ),
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: Align(
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    _buildIconButton(
                      icon: Icons.arrow_back_ios_rounded,
                      onPressed: _decrementFontWeight,
                      color: colorScheme.onPrimary,
                    ),
                    Expanded(
                      child: Align(
                        alignment: Alignment.center,
                        child: ValueListenableBuilder<FontWeight>(
                          valueListenable: fontWeightNotifier,
                          builder: (context, value, child) {
                            return Text(
                              _objectToString(value),
                              style: textStyle,
                            );
                          },
                        ),
                      ),
                    ),
                    _buildIconButton(
                      icon: Icons.arrow_forward_ios_rounded,
                      onPressed: _incrementFontWeight,
                      color: colorScheme.onPrimary,
                    ),
                  ],
                ),
              ),
            ),
            Divider(
              color: colorScheme.onPrimary,
              thickness: 1.5,
            ),
            Text(
              className,
              style: textStyle.copyWith(
                fontSize: textTheme.titleLarge!.fontSize! - 1,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildIconButton({
    required IconData icon,
    required VoidCallback onPressed,
    required Color color,
  }) {
    return IconButton(
      icon: Icon(icon),
      color: color,
      onPressed: onPressed,
    );
  }

}

class ColorNotifier extends ChangeNotifier{

final _colors = <NamedColor>[];

int _colorIdx = 0;

Color get color => _colors[_colorIdx];

void next() {
_colorIdx = (_colorIdx + 1) % _colors.length;
notifyListeners();
}

void prev() {
_colorIdx = (_colorIdx - 1 + _colors.length) % _colors.length;
notifyListeners();
}
}
