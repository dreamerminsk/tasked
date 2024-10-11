import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';

import 'root_card.dart';

class RootListView extends StatelessWidget {
  final roots = Rx<SplayTreeSet<String>>(SplayTreeSet<String>());

  @override
  Widget build(context) {
    final colorScheme = Theme.of(context).colorScheme;

    getTemporaryDirectory().then((d) {
      roots.value.add(d.path);
      roots.refresh();
    }).catchError((e) {
      Get.snackbar('getTemporaryDirectory', '$e',
          snackPosition: SnackPosition.BOTTOM);
    });

    getApplicationSupportDirectory().then((d) {
      roots.value.add(d.path);
      roots.value.add(d.parent.path);
      roots.refresh();
    }).catchError((e) {
      Get.snackbar('getApplicationSupportDirectory', '$e',
          snackPosition: SnackPosition.BOTTOM);
    });

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

    getExternalStorageDirectories(StorageDirectory.music).then((ds) {
      if (ds != null) {
        roots.value.addAll(ds.map<String>((item) => item.path));
        roots.refresh();
      }
    }).catchError((e) {
      Get.snackbar('getExternalStorageDirectories(StorageDirectory.music)', '$e',
          snackPosition: SnackPosition.BOTTOM);
    });

getExternalStorageDirectories(StorageDirectory.podcasts).then((ds) {
      if (ds != null) {
        roots.value.addAll(ds.map<String>((item) => item.path));
        roots.refresh();
      }
    }).catchError((e) {
      Get.snackbar('getExternalStorageDirectories(StorageDirectory.podcasts)', '$e',
          snackPosition: SnackPosition.BOTTOM);
    });

getExternalStorageDirectories(StorageDirectory.ringtones).then((ds) {
      if (ds != null) {
        roots.value.addAll(ds.map<String>((item) => item.path));
        roots.refresh();
      }
    }).catchError((e) {
      Get.snackbar('getExternalStorageDirectories(StorageDirectory.ringtones)', '$e',
          snackPosition: SnackPosition.BOTTOM);
    });

getExternalStorageDirectories(StorageDirectory.alarms).then((ds) {
      if (ds != null) {
        roots.value.addAll(ds.map<String>((item) => item.path));
        roots.refresh();
      }
    }).catchError((e) {
      Get.snackbar('getExternalStorageDirectories(StorageDirectory.alarms)', '$e',
          snackPosition: SnackPosition.BOTTOM);
    });

getExternalStorageDirectories(StorageDirectory.notifications).then((ds) {
      if (ds != null) {
        roots.value.addAll(ds.map<String>((item) => item.path));
        roots.refresh();
      }
    }).catchError((e) {
      Get.snackbar('getExternalStorageDirectories(StorageDirectory.notifications)', '$e',
          snackPosition: SnackPosition.BOTTOM);
    });

getExternalStorageDirectories(StorageDirectory.pictures).then((ds) {
      if (ds != null) {
        roots.value.addAll(ds.map<String>((item) => item.path));
        roots.refresh();
      }
    }).catchError((e) {
      Get.snackbar('getExternalStorageDirectories(StorageDirectory.pictures)', '$e',
          snackPosition: SnackPosition.BOTTOM);
    });

getExternalStorageDirectories(StorageDirectory.movies).then((ds) {
      if (ds != null) {
        roots.value.addAll(ds.map<String>((item) => item.path));
        roots.refresh();
      }
    }).catchError((e) {
      Get.snackbar('getExternalStorageDirectories(StorageDirectory.movies)', '$e',
          snackPosition: SnackPosition.BOTTOM);
    });

getExternalStorageDirectories(StorageDirectory.downloads).then((ds) {
      if (ds != null) {
        roots.value.addAll(ds.map<String>((item) => item.path));
        roots.refresh();
      }
    }).catchError((e) {
      Get.snackbar('getExternalStorageDirectories(StorageDirectory.downloads)', '$e',
          snackPosition: SnackPosition.BOTTOM);
    });

getExternalStorageDirectories(StorageDirectory.dcim).then((ds) {
      if (ds != null) {
        roots.value.addAll(ds.map<String>((item) => item.path));
        roots.refresh();
      }
    }).catchError((e) {
      Get.snackbar('getExternalStorageDirectories(StorageDirectory.dcim)', '$e',
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
          separatorBuilder: (BuildContext context, int index) =>
              const Divider(),
        ), // ListView.separated
        roots,
      ), // ObxValue
    );
  }
}
