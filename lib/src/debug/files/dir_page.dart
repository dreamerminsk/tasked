import 'package:flutter/material.dart';
import 'package:get/get.dart';

//import '../debug_controller.dart';
import 'sample_dir.dart';

class DirPage extends StatelessWidget {
  final path = ''.obs;
  final entries = [].obs;

  const DirPage(super.key, this.path);

  @override
  Widget build(context) {
    //final DebugController c = Get.find(tag: 'debugger');
    //final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    if (entries.value.isEmpty) {
      final d = Directory(path);
      d.list().map((item) => item.path).forEach((item) => entries.add(item));
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
