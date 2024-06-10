import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';

import 'root_card.dart';

class RootListView extends StatelessWidget {

  final roots = RxSet<String>();

  @override
  Widget build(context) {
    final colorScheme = Theme.of(context).colorScheme;

if (roots.isEmpty) {
getTemporaryDirectory().then((d) {
        roots.add(d.path);
        roots.add(d.parent.path);
      });

getApplicationSupportDirectory().then((d) {
        roots.add(d.path);
        roots.add(d.parent.path);
      });

getLibraryDirectory().then((d) {
        roots.add(d.path);
        roots.add(d.parent.path);
      });

getApplicationDocumentsDirectory().then((d) {
        roots.add(d.path);
        roots.add(d.parent.path);
      });

getApplicationCacheDirectory().then((d) {
        roots.add(d.path);
        roots.add(d.parent.path);
      });




     
   

      final Directory? result = await getExternalStorageDirectory();
      final List<Directory>? result = await getExternalCacheDirectories();
      final List<Directory>? result = await getExternalStorageDirectories();
      final Directory? result = await getDownloadsDirectory();

}

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
      appBar: AppBar(title: const Text('ROOTS'), actions: <Widget>[]),

      body: ListView(
        //padding: EdgeInsets.all(8),
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(8),
            child: ObxValue(
              (data) => RootCard(
                title: data.value,
                background: colorScheme.primary,
                foreground: colorScheme.onPrimary,
              ), // RootCard
              app,
            ),
          ), // Padding
          Padding(
            padding: EdgeInsets.all(8),
            child: ObxValue(
              (data) => RootCard(
                title: data.value,
                background: colorScheme.primary,
                foreground: colorScheme.onPrimary,
              ), // RootCard
              temp,
            ),
          ), // Padding
          Padding(
            padding: EdgeInsets.all(8),
            child: ObxValue(
              (data) => RootCard(
                title: data.value,
                background: colorScheme.primary,
                foreground: colorScheme.onPrimary,
              ), // RootCard
              docs,
            ),
          ), // Padding
          Padding(
            padding: EdgeInsets.all(8),
            child: ObxValue(
              (data) => RootCard(
                title: data.value,
                background: colorScheme.primary,
                foreground: colorScheme.onPrimary,
              ), // RootCard
              cache,
            ),
          ), // Padding
        ],
      ), // ListView
    );
  }
}
