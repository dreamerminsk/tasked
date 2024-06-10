import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';

import 'root_card.dart';

class RootListView extends StatelessWidget {
  final roots = RxList<String>();

  @override
  Widget build(context) {
    final colorScheme = Theme.of(context).colorScheme;

      final items = Set<String>();

      getTemporaryDirectory().then((d) {
        items.add(d.path);
      });

      getApplicationSupportDirectory().then((d) {
        items.add(d.path);
        items.add(d.parent.path);
      });

      getLibraryDirectory().then((d) {
        items.add(d.path);
      });

      getApplicationDocumentsDirectory().then((d) {
        items.add(d.path);
        items.add(d.parent.path);
      });

      getApplicationCacheDirectory().then((d) {
        items.add(d.path);
        items.add(d.parent.path);
      });

      getExternalStorageDirectory().then((d) {
if (d!= null){
        items.add(d.path);
items.add(d.parent.path);
}
      });

      getExternalCacheDirectories().then((ds) {
        if (ds != null) {
          items.addAll(ds.map<String>((item)=>item.path));
        }
      });

      getExternalStorageDirectories().then((ds) {
        if (ds != null) {
         items.addAll(ds.map<String>((item)=>item.path));
        }
      });

      getDownloadsDirectory().then((d) {
if (d!= null){
        items.add(d.path);
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
              title: data[index],
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
