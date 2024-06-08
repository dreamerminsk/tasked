import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';

import 'special_dir.dart';

class RootPathsView extends StatelessWidget {
  final app = ''.obs;

  final temp = ''.obs;

  final docs = ''.obs;

  final cache = ''.obs;

  @override
  Widget build(context) {
    final colorScheme = Theme.of(context).colorScheme;

    if (temp.value.isEmpty) {
      getTemporaryDirectory().then((d) => temp.value = d.path);
    }
    if (docs.value.isEmpty) {
      getApplicationDocumentsDirectory().then((d) {
        docs.value = d.path;
        app.value = d.parent.path;
      });
    }
    if (cache.value.isEmpty) {
      getApplicationCacheDirectory().then((d) => cache.value = d.path);
    }

    return Scaffold(
      appBar: AppBar(title: const Text('FILES'), actions: <Widget>[]),

      body: ListView(
        //padding: EdgeInsets.all(8),
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(8),
            child: ObxValue(
              (data) => SpecialDir(
                title: data.value,
                background: colorScheme.primary,
                foreground: colorScheme.onPrimary,
              ), // SampleDir
              app,
            ),
          ), // Padding
          Padding(
            padding: EdgeInsets.all(8),
            child: ObxValue(
              (data) => SpecialDir(
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
              (data) => SpecialDir(
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
              (data) => SpecialDir(
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
