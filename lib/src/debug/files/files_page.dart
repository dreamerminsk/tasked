import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';

//import '../debug_controller.dart';

class FilesPage extends StatelessWidget {

  final temp = ''.obs;

  final docs = ''.obs;

  final cache = ''.obs;

  @override
  Widget build(context) {
    //final DebugController c = Get.find(tag: 'debugger');
    //final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    if (temp.value.isEmpty) {
      getTemporaryDirectory().then(
        (d) => temp.value = d.path
      );
    }
    if (docs.value.isEmpty) {
      getApplicationDocumentsDirectory().then(
        (d) => docs.value = d.path
      );
    }
    if (cache.value.isEmpty) {
      getApplicationCacheDirectory().then(
        (d) => cache.value = d.path
      );
    }

    return Scaffold(
      body: ListView(
        //padding: EdgeInsets.all(8),
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(8),
            child: ObxValue(
              (data) =>   SampleDir(
                title: data.value,
                background: colorScheme.primary,
                foreground: colorScheme.onPrimary,
              ), // SampleDir
              temp,
            ),
          ), // Padding
          Padding(
            padding: EdgeInsets.all(8),
            child: ObxValue(
              (data) =>   SampleDir(
                title: data.value,
                background: colorScheme.primary,
                foreground: colorScheme.onPrimary,
              ), // SampleDir
              docs,
            ),
          ), // Padding
          Padding(
            padding: EdgeInsets.all(8),
            child: ObxValue(
              (data) =>   SampleDir(
                title: data.value,
                background: colorScheme.primary,
                foreground: colorScheme.onPrimary,
              ), // SampleDir
              cache,
            ),
          ), // Padding
        ],
      ), // ListView
    );
  }

}



class SampleDir extends StatelessWidget {
  final String title;
  final Color background;
  final Color foreground;

  const SampleDir({
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
          mainAxisAlignment: MainAxisAlignment.center,
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
