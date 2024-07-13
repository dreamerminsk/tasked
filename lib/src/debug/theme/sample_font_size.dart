import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SampleFontSize extends StatelessWidget {
  static const className = 'fontSize';

  final ValueNotifier<TextStyle> textStyleNotifier;

  final ValueNotifier<double> fontSizeNotifier;

  SampleFontSize({
    super.key,
    required this.textStyleNotifier,
  }) : fontSizeNotifier = ValueNotifier<double>(
            textStyleNotifier.value.fontSize ?? 16.0) {
    fontSizeNotifier.addListener(_updateTextStyle);
  }

  void _updateTextStyle() {
    textStyleNotifier.value =
        textStyleNotifier.value.copyWith(fontSize: fontSizeNotifier.value);
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
                      onPressed: _decrementFontSize,
                      color: colorScheme.onPrimary,
                    ),
                    Expanded(
                      child: Align(
                        alignment: Alignment.center,
                        child: ValueListenableBuilder<double>(
                          valueListenable: fontSizeNotifier,
                          builder: (context, value, child) {
                            return Text(
                              '$value',
                              style: textStyle,
                            );
                          },
                        ),
                      ),
                    ),
                    _buildIconButton(
                      icon: Icons.arrow_forward_ios_rounded,
                      onPressed: _incrementFontSize,
                      color: colorScheme.onPrimary,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 4),
            Divider(
              color: colorScheme.onPrimary,
              thickness: 1.5,
            ),
            const SizedBox(height: 4),
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

  //void _changeFontWeight(int direction) {
  //final currentIndex =
  //FontWeight.values.indexOf(value.value ?? FontWeight.w100);
  //final newIndex = (currentIndex + direction) % FontWeight.values.length;
  //value.value = FontWeight
  //.values[newIndex < 0 ? FontWeight.values.length - 1 : newIndex];
  //}

  void _decrementFontSize() {
    final fontSize =fontWeightNotifier.value;
    if (fontSize > 0) {
      fontSizeNotifier.value = fontSize - 1;
    }
  }

  void _incrementFontSize() {
    final fontSize = fontSizeNotifier.value;
    fontSizeNotifier.value =fontSize + 1;
  }
}
