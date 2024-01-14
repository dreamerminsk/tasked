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
        mainAxisAlignment:
          MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            crossAxisAlignment:
              CrossAxisAlignment.start,
            mainAxisAlignment:
              MainAxisAlignment.spaceAround,
            children: _files(randomThree, textTheme, colorScheme),
          ), // Column
          RotatedBox(
            quarterTurns: 3,
            child: Text('JSON Viewer',
              style: textTheme.titleLarge!
                .copyWith(
                  color: colorScheme.onPrimary
                ),
            ), // Text
          ), // RotatedBox
        ],
      ), // Row
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ), // BorderRadius
        color: colorScheme.primary.withOpacity(0.75),
      ), // BoxDecoration
    ); //Container
  }

  List<Widget> _files(List<String> five, TextTheme tt, ColorScheme cs) {
    return List<Widget>.generate(5,
      (int index) => 
      InkWell(
        onTap: () {
          Get.toNamed(Routes.JSON, arguments: five[index],);
        },
        child: Text(
          five[index].split('/').last,
            style: tt.bodyLarge!
              .copyWith(
                color: cs.onPrimary
              ),
        ), // Text
      ), // InkWell                 
    );
  }
}
