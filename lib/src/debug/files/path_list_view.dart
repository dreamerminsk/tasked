import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';

import 'requested_path.dart';
import 'requested_paths.dart';

class PathListView extends StatelessWidget {

  @override
  Widget build(context) {
    final colorScheme = Theme.of(context).colorScheme;

    getLibraryDirectory().then((d) {
      roots.value.add(d.path);
      roots.refresh();
    }).catchError((e) {
      Get.snackbar('getLibraryDirectory', '$e',
          snackPosition: SnackPosition.BOTTOM);
    });

    getApplicationDocumentsDirectory().then((d) {
      roots.value.add(d.path);
      roots.value.add(d.parent.path);
      roots.refresh();
    }).catchError((e) {
      Get.snackbar('getApplicationDocumentsDirectory', '$e',
          snackPosition: SnackPosition.BOTTOM);
    });

    getApplicationCacheDirectory().then((d) {
      roots.value.add(d.path);
      roots.value.add(d.parent.path);
      roots.refresh();
    }).catchError((e) {
      Get.snackbar('getApplicationCacheDirectory', '$e',
          snackPosition: SnackPosition.BOTTOM);
    });

    getExternalStorageDirectory().then((d) {
      if (d != null) {
        roots.value.add(d.path);
        roots.value.add(d.parent.path);
        roots.refresh();
      }
    }).catchError((e) {
      Get.snackbar('getExternalStorageDirectory', '$e',
          snackPosition: SnackPosition.BOTTOM);
    });

    getExternalCacheDirectories().then((ds) {
      if (ds != null) {
        roots.value.addAll(ds.map<String>((item) => item.path));
        roots.refresh();
      }
    }).catchError((e) {
      Get.snackbar('getExternalCacheDirectories', '$e',
          snackPosition: SnackPosition.BOTTOM);
    });

    getExternalStorageDirectories().then((ds) {
      if (ds != null) {
        roots.value.addAll(ds.map<String>((item) => item.path));
        roots.refresh();
      }
    }).catchError((e) {
      Get.snackbar('getExternalStorageDirectories', '$e',
          snackPosition: SnackPosition.BOTTOM);
    });

    getDownloadsDirectory().then((d) {
      if (d != null) {
        roots.value.add(d.path);
        roots.refresh();
      }
    }).catchError((e) {
      Get.snackbar('getDownloadsDirectory', '$e',
          snackPosition: SnackPosition.BOTTOM);
    });

    return Scaffold(
      appBar: AppBar(title: const Text('ROOTS'), actions: <Widget>[]),

      body: ListView(
padding: const EdgeInsets.all(8),
children: <Widget>[
RequestedPath(name:'getTemporaryDirectory()', request:getTemporaryDirectory(),), // RequestedPath
RequestedPath(name:'getApplicationSupportDirectory()', request:getApplicationSupportDirectory(),), // RequestedPath
],
), // ListView
    );
  }
}
