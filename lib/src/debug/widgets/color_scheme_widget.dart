import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tasked/main.dart';
import '../../routes/app_pages.dart';
import '../../core/theme_notifier.dart';

class ColorSchemeWidget extends StatelessWidget {
  const ColorSchemeWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
        final themeProvider = Provider.of<ThemeNotifier>(context);

    return Material(
      elevation: 4,
      borderRadius: BorderRadius.all(Radius.circular(20)),
      child: InkWell(
        onTap: () {
          Get.toNamed(Routes.COLORSCHEME);
        },
        child: Container(
          width: Get.width,
          height: 96,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'colorScheme',
                style: textTheme.headlineSmall!
                    .copyWith(color: colorScheme.onPrimary),
              ), // Text
              Text(
                '${themeProvider.seed.toString()}',
                style:
                    textTheme.bodyLarge!.copyWith(color: colorScheme.onPrimary),
              ), // Text
            ],
          ), // Column
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ), // BorderRadius
            color: colorScheme.primary,
          ), // BoxDecoration
        ), //Container
      ), // InkWell
    ); // Material
  }
}
