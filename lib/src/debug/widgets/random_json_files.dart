//import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../routes/app_pages.dart';


class RandomJsonFiles extends StatelessWidget {
  final List<String> jsonFiles;

  final RxList<String> randomFive = RxList<String>();
  
  RandomJsonFiles({
    super.key,
    required this.jsonFiles,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    //final randomThree = (jsonFiles.toList()..shuffle()).take(5).toList();
    
    _shuffle();
    
    return Container(
      width: Get.width,
      height: 200,
      child: Row(
        mainAxisAlignment:
          MainAxisAlignment.spaceBetween,
        children: <Widget>[
          ObxValue(
            (data) => _files(data, textTheme, colorScheme),
              randomFive,
          ), // ObxValue
          GestureDetector(
            onTap: () => _shuffle(),
            child: RotatedBox(
              quarterTurns: 3,
              child: Text('JSON Viewer',
                style: textTheme.titleLarge!
                  .copyWith(
                    color: colorScheme.onPrimary
                  ),
              ), // Text
            ), // RotatedBox
          ), // GestureDetector
        ],
      ), // Row
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ), // BorderRadius
        color: colorScheme.primary,
      ), // BoxDecoration
    ); //Container
  }

  void _shuffle() {
    final random5 = (jsonFiles.toList()..shuffle()).take(5).toList();
    randomFive.assignAll(random5);
  }

  Widget _files(List<String> five, TextTheme tt, ColorScheme cs) {
    return Column(
            crossAxisAlignment:
              CrossAxisAlignment.start,
            mainAxisAlignment:
              MainAxisAlignment.spaceAround,
            children: List<Widget>.generate(5,
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
            ),
          ); // Column
  }
}
