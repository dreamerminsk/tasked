import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';

//import '../debug_controller.dart';
import 'sample_dir.dart';

class DirPage extends StatelessWidget {

  final temp = ''.obs;

  final docs = ''.obs;

  final cache = ''.obs;

 final path = ''.obs;


  const DirPage(super.key, this.path);

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
