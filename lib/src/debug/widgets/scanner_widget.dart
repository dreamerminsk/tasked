import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../routes/app_pages.dart';

class ScannerWidget extends StatelessWidget {
  const ScannerWidget({
    super.key,
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
          Get.toNamed(Routes.SCANNER);
        },
        child: Container(
          width: Get.width,
          height: 100,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'scanner',
                style: textTheme.headlineSmall!.copyWith(
                  fontWeight: FontWeight.w700,
                  color: colorScheme.onPrimaryContainer,
                ),
              ), // Text
            ],
          ), // Column
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ), // BorderRadius
            color: colorScheme.primaryContainer,
          ), // BoxDecoration
        ), //Container
      ), // InkWell
    ); // Material
  }
}
