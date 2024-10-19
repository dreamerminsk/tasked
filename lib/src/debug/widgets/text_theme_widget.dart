import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/text_theme.dart';
import '../../routes/app_pages.dart';

class TextThemeWidget extends StatelessWidget {
  late final List<NamedTextStyle> _styles;

  final ValueNotifier<int> primaryTextStyle;

  TextThemeWidget({super.key})
      : primaryTextStyle = ValueNotifier<int>(4);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    _styles = NamedTextTheme.of(context).values;

    return Material(
      elevation: 1,
      borderRadius: BorderRadius.all(Radius.circular(20)),
            child: GestureDetector(
        onTap: () {
          Get.toNamed(Routes.TEXTTHEME);
        },
        onHorizontalDragEnd: (details) {
          if (details.primaryVelocity == null) return;
          if (details.primaryVelocity! < 0) {
            primaryTextStyle.value =
                (primaryTextStyle.value + _styles.length - 1) % _styles.length;
          } else {
            primaryTextStyle.value = (primaryTextStyle.value + 1) % _styles.length;
          }
        },
        child: Container(
          width: Get.width,
          height: 100,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            color: colorScheme.primary,
          ),
          child: ValueListenableBuilder<int>(
            valueListenable: primaryTextStyle,
            builder: (context, value, child) => Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'textTheme',
                  style: _styles[value].value.copyWith(
                        fontWeight: FontWeight.w300,
                        color: colorScheme.onPrimary,
                      ),
                ),
                Text(
                  '${_styles[value].name}',
                  style: textTheme.bodyLarge!.copyWith(
                    color: colorScheme.onPrimary,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}