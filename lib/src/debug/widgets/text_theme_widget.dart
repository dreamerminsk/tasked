import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../routes/app_pages.dart';

class TextThemeWidget extends StatelessWidget {
  const TextThemeWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Material(
      elevation: 1,
      borderRadius: BorderRadius.all(Radius.circular(20)),
      child: InkWell(
        onTap: () {
          Get.toNamed(Routes.TEXTTHEME);
        },
        child: Container(
          width: Get.width,
          height: 100,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'textTheme',
                style: textTheme.headlineSmall!
                    .copyWith(color: colorScheme.onPrimary),
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
      ),
    ); // Material
  }
}
