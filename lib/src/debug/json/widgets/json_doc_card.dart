import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../json_controller.dart';

class JsonDocCard extends StatelessWidget {
  const JsonDocCard({super.key});

  @override
  Widget build(BuildContext context) {
    final JsonController c = Get.find();
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      margin: const EdgeInsets.all(8.0),
      width: Get.width,
      height: 200,
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: colorScheme.primary,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'pos: 0',
                style:
                    textTheme.bodyLarge!.copyWith(color: colorScheme.onPrimary),
              ),
              Obx(() => Text(
                    'length: ${c.content.value.length}',
                    style: textTheme.bodyLarge!
                        .copyWith(color: colorScheme.onPrimary),
                  )),
            ],
          ),
          Container(
            height: 200,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              border: Border(
                left: BorderSide(
                  color: colorScheme.onPrimary,
                  width: 2,
                ),
              ),
            ),
            child: RotatedBox(
              quarterTurns: 3,
              child: Text(
                'JsonDocument',
                style: textTheme.titleLarge!
                    .copyWith(color: colorScheme.onPrimary),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
