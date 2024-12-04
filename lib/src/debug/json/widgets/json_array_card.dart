import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../json_controller.dart';

class JsonArrayCard extends StatelessWidget {
  final JsonController c = Get.find();

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      margin: EdgeInsets.all(8.0),
      width: Get.width,
      height: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Text(
                'pos: 0',
                style:
                    textTheme.bodyLarge!.copyWith(color: colorScheme.onPrimary),
              ), // Text
              Text(
                'length: ${c.content.value.length}',
                style:
                    textTheme.bodyLarge!.copyWith(color: colorScheme.onPrimary),
              ), // Text
            ],
          ), // Column
          Container(
            height: 200,
            alignment: Alignment.center,
            child: RotatedBox(
              quarterTurns: 3,
              child: Text(
                'JsonArray',
                style: textTheme.titleLarge!
                    .copyWith(color: colorScheme.onPrimary),
              ), // Text
            ), // RotatedBox,
            decoration: BoxDecoration(
              border: Border(
                left: BorderSide(
                  color: colorScheme.onPrimary,
                  width: 1,
                ), // BorderSide
              ), // Border
            ), // BoxDecoration
          ), // Container
        ],
      ), // Row
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ), // BorderRadius
        color: colorScheme.primary,
      ), // BoxDecoration
    ); //Container
  }
}
