//import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../routes/app_pages.dart';


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
      child: Row(
        crossAxisAlignment:
          CrossAxisAlignment.start,
        mainAxisAlignment:
          MainAxisAlignment.start,
        children: <Widget>[
          Column(
            crossAxisAlignment:
              CrossAxisAlignment.start,
            mainAxisAlignment:
              MainAxisAlignment.spaceAround,
            children: _files(textTheme, colorScheme),
          ), // Column
        ],
      ), // Row
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ), // BorderRadius
        color: colorScheme.secondaryContainer,
      ), // BoxDecoration
    ); //Container
  }

  List<Widget> _files(TextTheme tt, ColorScheme cs) {
    return List<Widget>.generate(5,
      (int index) => 
      InkWell(
        onTap: () {
          Get.toNamed(Routes.JSON, arguments: randomThree[index],);
        },
        child: Text(
          randomThree[index].split('/').last,
            style: textTheme.titleLarge!
              .copyWith(
                color: colorScheme.onSecondaryContainer
              ),
        ), // Text
      ), // InkWell                 
    );
  }
}
