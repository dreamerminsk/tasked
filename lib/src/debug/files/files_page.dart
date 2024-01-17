import 'package:flutter/material.dart';
import 'package:get/get.dart';

//import '../debug_controller.dart';

class FilesPage extends StatelessWidget {

  final temp = ''.obx;

  @override
  Widget build(context) {
    //final DebugController c = Get.find(tag: 'debugger');
    //final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      body: ListView(
        //padding: EdgeInsets.all(8),
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(8),
            child: SampleColor(
              title: 'primary',
              background: colorScheme.primary,
              foreground: colorScheme.onPrimary,
            ), // ColorContainer
          ), // Padding
        ],
      ), // ListView
    );
  }

}



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
      child: Container(
        width: Get.width,
        height: 100,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Text(
              title,
              style: textTheme.titleMedium!
                .copyWith(
                  color: foreground,
              ),
            ), // Text
            Text(
              '$background',
              style: textTheme.bodyMedium!
                .copyWith(
                  color: foreground,
              ),
            ), // Text
          ],
        ), // Column
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ), // BorderRadius
          color: background,
        ), // BoxDecoration
      ), // Container
    ); // Material
  }
}
