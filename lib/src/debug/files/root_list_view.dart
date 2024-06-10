import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';

import 'root_card.dart';

class RootListView extends StatelessWidget {
  final roots = RxSet<String>();

  @override
  Widget build(context) {
    final colorScheme = Theme.of(context).colorScheme;

      getTemporaryDirectory().then((d) {
        roots.add(d.path);
      });

      getApplicationSupportDirectory().then((d) {
        roots.add(d.path);
        roots.add(d.parent.path);
      });

      getLibraryDirectory().then((d) {
        roots.add(d.path);
      });

      getApplicationDocumentsDirectory().then((d) {
        roots.add(d.path);
        roots.add(d.parent.path);
      });

      getApplicationCacheDirectory().then((d) {
        roots.add(d.path);
        roots.add(d.parent.path);
      });

      getExternalStorageDirectory().then((d) {
if (d!= null){
        roots.add(d.path);
roots.add(d.parent.path);
}
      });

      getExternalCacheDirectories().then((ds) {
        if (ds != null) {
          roots.addAll(ds.map<String>((item)=>item.path));
        }
      });

      getExternalStorageDirectories().then((ds) {
        if (ds != null) {
         roots.addAll(ds.map<String>((item)=>item.path));
        }
      });

      getDownloadsDirectory().then((d) {
if (d!= null){
        roots.add(d.path);
}
      });
    

    return Scaffold(
      appBar: AppBar(title: const Text('ROOTS'), actions: <Widget>[]),

      body: ObxValue(
        (data) => ListView.separated(
          padding: const EdgeInsets.all(8),
          itemCount: data.length,
          itemBuilder: (BuildContext context, int index) {
            return RootCard(
              title: data.elementAt(index),
              background: colorScheme.primary,
              foreground: colorScheme.onPrimary,
            ); // RootCard
          },
          separatorBuilder: (BuildContext context, int index) =>
              const Divider(),
        ), // ListView.separated
        roots,
      ), // ObxValue
    );
  }
}
