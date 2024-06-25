import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'button_theme_page.dart';
import 'card_theme_page.dart';

class SampleTheme extends StatelessWidget {
  static final Map<String, Function> routes = {
    'ButtonThemeData': (ButtonThemeData value) => ButtonThemePage(theme: value),
    'CardTheme': (CardTheme value) => CardThemePage(theme: value),
  };
  final String title;
  final Object? theme;

  const SampleTheme({
    super.key,
    required this.title,
    required this.theme,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Material(
      elevation: 2,
      borderRadius: BorderRadius.all(Radius.circular(20)),
      child: InkWell(
        onTap: () {
          final name = theme?.runtimeType.toString() ?? 'Object';
          if (routes.containsKey(name)) {
            if (theme != null) {
              Get.to(routes[name]!.call(theme!));
            }
          }
          //Get.toNamed(Routes.THEME);
        },
        child: Container(
          width: Get.width,
          height: 100,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                title,
                style: textTheme.headlineSmall!.copyWith(
                  color: theme == null
                      ? colorScheme.onSurface
                      : colorScheme.onPrimary,
                ),
              ), // Text
            ],
          ), // Column
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ), // BorderRadius
            color: theme == null
                ? colorScheme.surfaceDim
                : colorScheme.primary,
          ), // BoxDecoration
        ), //Container
      ), // InkWell
    ); // Material
  }
}
