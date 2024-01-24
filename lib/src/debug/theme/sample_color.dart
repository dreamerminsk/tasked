import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SampleColor extends StatelessWidget {
  final String title;
  final Color background;
  final Color foreground;

  const SampleColor({
    required this.title,
    required this.background,
    required this.foreground,
  });

  @override
  Widget build(context) {
    final textTheme = Theme.of(context).textTheme;
    //final colorScheme = Theme.of(context).colorScheme;

    return Material(
      elevation: 2,
      borderRadius:
        BorderRadius.all(Radius.circular(20)),
      child: InkWell(
        child: Container(
          width: Get.width,
          height: 100,
          alignment: Alignment.bottomCenter,
          child: Container(
            padding: EdgeInsets.fromLTRB(8, 2, 8, 2),
            decoration: BoxDecoration(
              color: Colors.transparent,
              border: Border.all(
                color: foreground,
                width: 2.0,
              ), // Border
              borderRadius: BorderRadius.circular(12),
            ), // BoxDecoration
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Text(
                  title,
                  style: textTheme.titleLarge!
                    .copyWith(
                      color: foreground,
                  ),
                ), // Text
              ],
            ), // Column
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ), // BorderRadius
            color: background,
          ), // BoxDecoration
        ), // Container
      ), // InkWell
    ); // Material
  }
}
