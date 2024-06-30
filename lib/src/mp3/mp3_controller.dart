import 'dart:core';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';
import 'package:nanoid2/nanoid2.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

import '../debug/debug_controller.dart';
import '../tasklist/task/task_item.dart';

class Mp3Controller extends GetxController {
  final id = nanoid();

  final started = DateTime.now();

  final DebugController debug = Get.find(tag: 'debugger');

  final task = Rxn<TaskItem>();

  final mp3file = Rxn<File>();

  final mp3Files = <File>[].obs;

  @override
  void onInit() {
    super.onInit();
    debug.logInit(this.runtimeType.toString(), id, started);
  }

  @override
  void onReady() {
    super.onReady();
    task.value = Get.arguments;
    searchForMp3Files();
  }

  @override
  void onClose() {
    debug.logClose(this.runtimeType.toString(), id, DateTime.now());
    super.onClose();
  }

  void pickFile() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles();
      if (result != null) {
        mp3file.value = File(result.files.single.path!);
      } else {
        Get.snackbar('mp3::pickFile', 'FilePicker cancelled...',
            snackPosition: SnackPosition.BOTTOM);
      }
    } catch (e) {
      Get.snackbar('mp3::pickFile', '$e', snackPosition: SnackPosition.BOTTOM);
    }
  }

  Future<void> searchForMp3Files() async {
    List<Directory> directories = await _getDirectoriesToSearch();
    List<File> foundFiles = [];

    for (var dir in directories) {
      foundFiles.addAll(await _searchDirectoryForMp3Files(dir));
    }

    mp3Files.value = foundFiles;
  }

  Future<List<Directory>> _getDirectoriesToSearch() async {
    List<Directory> directories = [];

getApplicationCacheDirectory().then((d) {
      directories.add(d);
    }).catchError((e) {
      Get.snackbar('getApplicationCacheDirectory', '$e',
          snackPosition: SnackPosition.BOTTOM);
    });

getApplicationDocumentsDirectory().then((d) {
      directories.add(d);
    }).catchError((e) {
      Get.snackbar('getApplicationDocumentsDirectory', '$e',
          snackPosition: SnackPosition.BOTTOM);
    });

getApplicationSupportDirectory().then((d) {
      directories.add(d);
    }).catchError((e) {
      Get.snackbar('getApplicationSupportDirectory', '$e',
          snackPosition: SnackPosition.BOTTOM);
    });

getDownloadsDirectory().then((d) {
      if (d != null) {
      directories.add(d);
    }
    }).catchError((e) {
      Get.snackbar('getDownloadsDirectory', '$e',
          snackPosition: SnackPosition.BOTTOM);
    });

getExternalCacheDirectories().then((ds) {
      if (ds != null) {
      directories.addAll(ds);
    }
    }).catchError((e) {
      Get.snackbar('getExternalCacheDirectories', '$e',
          snackPosition: SnackPosition.BOTTOM);
    });

getExternalStorageDirectories().then((ds) {
      if (ds != null) {
      directories.addAll(ds);
    }
    }).catchError((e) {
      Get.snackbar('getExternalCacheDirectories', '$e',
          snackPosition: SnackPosition.BOTTOM);
    });

getExternalStorageDirectory().then((d) {
      if (d != null) {
      directories.add(d);
    }
    }).catchError((e) {
      Get.snackbar('getExternalStorageDirectory', '$e',
          snackPosition: SnackPosition.BOTTOM);
    });

getLibraryDirectory().then((d) {
      directories.add(d);
    }).catchError((e) {
      Get.snackbar('getLibraryDirectory', '$e',
          snackPosition: SnackPosition.BOTTOM);
    });

getTemporaryDirectory().then((d) {
      directories.add(d);
    }).catchError((e) {
      Get.snackbar('getTemporaryDirectory', '$e',
          snackPosition: SnackPosition.BOTTOM);
    });

    return directories;
  }

  Future<List<File>> _searchDirectoryForMp3Files(Directory directory) async {
    List<File> mp3Files = [];
    final List<FileSystemEntity> entities = await  directory.list(recursive: true).toList();

    for (var entity in entities) {
      if (entity is File && p.extension(entity.path).toLowerCase() == '.mp3') {
        mp3Files.add(entity);
      }
    }

    return mp3Files;
  }
}
