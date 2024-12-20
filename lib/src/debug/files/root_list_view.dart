import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';

import 'root_card.dart';
import 'root_list_card.dart';

class RootListView extends StatelessWidget {
  final roots = Rx<SplayTreeSet<String>>(SplayTreeSet<String>());

  Future<Null> handleStorageError(String operation, dynamic error) async {
    Get.snackbar(
      operation,
      '$error',
      snackPosition: SnackPosition.BOTTOM,
    );
    return null;
  }

  @override
  Widget build(context) {
    final colorScheme = Theme.of(context).colorScheme;

    getTemporaryDirectory().then((d) {
      roots.value.add(d.path);
      roots.refresh();
    }).catchError((e) => handleStorageError('getTemporaryDirectory', e));

    getApplicationSupportDirectory().then((d) {
      roots.value.add(d.path);
      roots.refresh();
    }).catchError(
        (e) => handleStorageError('getApplicationSupportDirectory', e));

    getLibraryDirectory().then((d) {
      roots.value.add(d.path);
      roots.refresh();
    }).catchError((e) => handleStorageError('getLibraryDirectory', e));

    getApplicationDocumentsDirectory().then((d) {
      roots.value.add(d.path);
      roots.refresh();
    }).catchError(
        (e) => handleStorageError('getApplicationDocumentsDirectory', e));

    getApplicationCacheDirectory().then((d) {
      roots.value.add(d.path);
      roots.refresh();
    }).catchError((e) => handleStorageError('getApplicationCacheDirectory', e));

    getExternalStorageDirectory().then((d) {
      if (d != null) {
        roots.value.add(d.path);
        roots.refresh();
      }
    }).catchError((e) => handleStorageError('getExternalStorageDirectory', e));

    getExternalCacheDirectories().then((ds) {
      if (ds != null) {
        roots.value.addAll(ds.map<String>((item) => item.path));
        roots.refresh();
      }
    }).catchError((e) => handleStorageError('getExternalCacheDirectories', e));

    for (var storageType in StorageDirectory.values) {
      getExternalStorageDirectories(type: storageType).then((ds) {
        if (ds != null) {
          roots.value.addAll(ds.map<String>((item) => item.path));
          roots.refresh();
        }
      }).catchError((e) =>
          handleStorageError('getExternalStorageDirectories($storageType)', e));
    }

    getDownloadsDirectory().then((d) {
      if (d != null) {
        roots.value.add(d.path);
        roots.refresh();
      }
    }).catchError((e) => handleStorageError('getDownloadsDirectory', e));

    return Scaffold(
      appBar: AppBar(
          title: const Text('${RootListCard.title} ${RootListCard.version}'),
          actions: <Widget>[]),

      body: ObxValue(
        (data) => ListView.separated(
          padding: const EdgeInsets.all(8),
          itemCount: data.value.length,
          itemBuilder: (BuildContext context, int index) {
            return RootCard(
              title: data.value.elementAt(index),
              background: colorScheme.primary,
              foreground: colorScheme.onPrimary,
            ); // RootCard
          },
          separatorBuilder: (BuildContext context, int index) => Divider(
            thickness: 2,
            indent: 16,
            endIndent: 16,
            color: colorScheme.primary,
          ),
        ), // ListView.separated
        roots,
      ), // ObxValue
    );
  }
}
