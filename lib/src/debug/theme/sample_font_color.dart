import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SampleFontColor extends StatelessWidget {
  static const className = 'fontColor';

  final ValueNotifier<FontWeight> fontColorNotifier;

  SampleFontColor({
    super.key,
    color,
  }) : fontColorNotifier = ValueNotifier<Color>(
            color ?? NamedColors.black) {
    
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
                      onPressed: _decrementFontColor,
                      color: colorScheme.onPrimary,
                    ),
                    Expanded(
                      child: Align(
                        alignment: Alignment.center,
                        child: ValueListenableBuilder<Color>(
                          valueListenable: fontColorNotifier,
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
                      onPressed: _incrementFontColor,
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

  void _decrementFontWeight() {
    final index = FontWeight.values.indexOf(fontWeightNotifier.value);
    if (index > 0) {
      fontWeightNotifier.value = FontWeight.values[index - 1];
    } else {
      fontWeightNotifier.value = FontWeight.values.last;
    }
  }

  void _incrementFontWeight() {
    final index = FontWeight.values.indexOf(fontWeightNotifier.value);
    fontWeightNotifier.value =
        FontWeight.values[(index + 1) % FontWeight.values.length];
  }

  String _objectToString(FontWeight object) {
    final name = object.toString().contains('.')
        ? object.toString().split('.').last
        : '.w${object.value}';
    return name;
  }
}
