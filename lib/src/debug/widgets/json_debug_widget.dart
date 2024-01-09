import 'package:flutter/material.dart';
import 'package:get/get.dart';

class JsonDebugWidget extends StatelessWidget {
  final String jsonFile;
  
  const JsonDebugWidget({
    super.key,
    this.jsonFile = 'NOT IMPLEMENTED',
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      width: Get.width,
      height: 200,
      child: Column(
        crossAxisAlignment:
          CrossAxisAlignment.start,
        mainAxisAlignment:
          MainAxisAlignment.spaceAround,
        children: <Widget>[
          Text(
            jsonFile,
            style: textTheme.headlineSmall!
              .copyWith(
                color: colorScheme.onSecondaryContainer
              ),
          ), // Text
          Text(
            jsonFile,
            style: textTheme.titleLarge!
              .copyWith(
                color: colorScheme.onSecondaryContainer
              ),
          ), // Text
        ],
      ), // Column
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ), // BorderRadius
        color: colorScheme.secondaryContainer,
      ), // BoxDecoration
    ); //Container
  }
}
