import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../routes/app_pages.dart';

class PathProviderCard extends StatelessWidget {
  const PathProviderCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Material(
      elevation: 2,
      borderRadius: const BorderRadius.all(Radius.circular(20)),
      child: InkWell(
        onTap: () {
          Get.toNamed(Routes.PATHS);
        },
        child: Container(
          width: Get.width,
          height: 96,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'path_provider',
                style: textTheme.headlineSmall!
                    .copyWith(color: colorScheme.onPrimary),
              ), // Text
            ],
          ), // Column
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(
              Radius.circular(20),
            ), // BorderRadius
            color: colorScheme.primary,
          ), // BoxDecoration
        ), //Container
      ), // InkWell
    ); // Material
  }
}
