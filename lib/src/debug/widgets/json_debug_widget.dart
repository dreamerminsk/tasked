//import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class JsonDebugWidget extends StatelessWidget {
  final List<String> jsonFiles;
  
  const JsonDebugWidget({
    super.key,
    required this.jsonFiles,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    //final jsonFile = jsonFiles[Random.secure().nextInt(jsonFiles.length)];
    final randomThree = (jsonFiles.toList()..shuffle()).take(5).toList();
    
    return Container(
      width: Get.width,
      height: 200,
      child: Column(
        crossAxisAlignment:
          CrossAxisAlignment.start,
        mainAxisAlignment:
          MainAxisAlignment.spaceAround,
        children: <Widget>[
          InkWell(
            onTap: () {
              Get.toNamed(Routes.JSON, arguments: randomThree[0],);
            },
            child: Text(
              randomThree[0].split('/').last,
              style: textTheme.titleLarge!
                .copyWith(
                  color: colorScheme.onSecondaryContainer
                ),
            ), // Text
          ), // InkWell
          InkWell(
            onTap: () {
              Get.toNamed(Routes.JSON, arguments: randomThree[1],);
            },
            child: Text(
              randomThree[1].split('/').last,
              style: textTheme.titleLarge!
                .copyWith(
                  color: colorScheme.onSecondaryContainer
                ),
            ), // Text
          ), // InkWell
          InkWell(
            onTap: () {
              Get.toNamed(Routes.JSON, arguments: randomThree[2],);
            },
            child: Text(
              randomThree[2].split('/').last,
              style: textTheme.titleLarge!
                .copyWith(
                  color: colorScheme.onSecondaryContainer
                ),
            ), // Text
          ), // InkWell
          InkWell(
            onTap: () {
              Get.toNamed(Routes.JSON, arguments: randomThree[3],);
            },
            child: Text(
              randomThree[3].split('/').last,
              style: textTheme.titleLarge!
                .copyWith(
                  color: colorScheme.onSecondaryContainer
                ),
            ), // Text
          ), // InkWell
          InkWell(
            onTap: () {
              Get.toNamed(Routes.JSON, arguments: randomThree[4],);
            },
            child: Text(
              randomThree[4].split('/').last,
              style: textTheme.titleLarge!
                .copyWith(
                  color: colorScheme.onSecondaryContainer
                ),
            ), // Text
          ), // InkWell
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
