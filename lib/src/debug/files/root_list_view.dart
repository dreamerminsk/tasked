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
      }).catchError(e) {
Get.snackbar('getTemporaryDirectory','$e',snackbarPosition: SnackbarPosition.BOTTOM);
};

      getApplicationSupportDirectory().then((d) {
        roots.add(d.path);
        roots.add(d.parent.path);
      }).catchError(e) {
Get.snackbar('getApplicationSupportDirectory','$e',snackbarPosition: SnackbarPosition.BOTTOM);
};

      getLibraryDirectory().then((d) {
        roots.add(d.path);
      }).catchError(e) {
Get.snackbar('getLibraryDirectory','$e',snackbarPosition: SnackbarPosition.BOTTOM);
};

      getApplicationDocumentsDirectory().then((d) {
        roots.add(d.path);
        roots.add(d.parent.path);
      }).catchError(e) {
Get.snackbar('getApplicationDocumentsDirectory','$e',snackbarPosition: SnackbarPosition.BOTTOM);
};

      getApplicationCacheDirectory().then((d) {
        roots.add(d.path);
        roots.add(d.parent.path);
      }).catchError(e) {
Get.snackbar('getApplicationCacheDirectory','$e',snackbarPosition: SnackbarPosition.BOTTOM);
};

      getExternalStorageDirectory().then((d) {
if (d!= null){
        roots.add(d.path);
roots.add(d.parent.path);
}
      }).catchError(e) {
Get.snackbar('getExternalStorageDirectory','$e',snackbarPosition: SnackbarPosition.BOTTOM);
};

      getExternalCacheDirectories().then((ds) {
        if (ds != null) {
          roots.addAll(ds.map<String>((item)=>item.path));
        }
      }).catchError(e) {
Get.snackbar('getExternalCacheDirectories','$e',snackbarPosition: SnackbarPosition.BOTTOM);
};

      getExternalStorageDirectories().then((ds) {
        if (ds != null) {
         roots.addAll(ds.map<String>((item)=>item.path));
        }
      }).catchError(e) {
Get.snackbar('getExternalStorageDirectories','$e',snackbarPosition: SnackbarPosition.BOTTOM);
};

      getDownloadsDirectory().then((d) {
if (d!= null){
        roots.add(d.path);
}
      }).catchError(e) {
Get.snackbar('getDownloadsDirectory','$e',snackbarPosition: SnackbarPosition.BOTTOM);
};
    

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
