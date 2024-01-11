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
    final randomThree = (jsonFiles.toList()..shuffle()).take(3).toList();
    
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
            randomThree[0].split('/').last,
            style: textTheme.titleMedium!
              .copyWith(
                color: colorScheme.onSecondaryContainer
              ),
          ), // Text
          Text(
            randomThree[1].split('/').last,
            style: textTheme.titleMedium!
              .copyWith(
                color: colorScheme.onSecondaryContainer
              ),
          ), // Text
          Text(
            randomThree[2].split('/').last,
            style: textTheme.titleMedium!
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
