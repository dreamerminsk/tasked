import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../routes/app_pages.dart';

class ColorSchemeWidget extends StatelessWidget {
  
  const ColorSchemeWidget({
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
        onTap: () => {
          Get.toNamed(Routes.COLORSCHEME); 
        },
        child: Container(
          width: Get.width,
          height: 100,
          child: Column(
            crossAxisAlignment:
              CrossAxisAlignment.center,
            mainAxisAlignment:
              MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'colorSchemeViewer',
                style: textTheme.headlineSmall!
                  .copyWith(
                    color:
                      colorScheme.onTertiaryContainer
                  ),
              ), // Text
            ],
          ), // Column
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ), // BorderRadius
            color: colorScheme.tertiaryContainer,
          ), // BoxDecoration
        ), //Container
      ), // InkWell
    ); // Material
  }
}
