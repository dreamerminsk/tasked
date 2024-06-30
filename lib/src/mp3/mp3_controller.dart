import 'dart:core';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';
import 'package:nanoid2/nanoid2.dart';

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

final appCache = await getApplicationCacheDirectory();
if (appCache!= null) {
directories.add(appCache);
}

final appDocs = await getApplicationDocumentsDirectory();
if (appDocs!= null) {
directories.add(appDocs);
}

final appSupport = await getApplicationSupportDirectory();
if (appSupport!= null) {
directories.add(appSupport);
}

final downloads = await getDownloadsDirectory();
if (downloads!= null) {
directories.add(downloads);
}

final cache = await getExternalCacheDirectories();
if (cache!= null) {
directories.addAll(cache);
}

final storage = await getExternalStorageDirectories();
if (storage!= null) {
directories.addAll(storage);
}

    final externalDir = await getExternalStorageDirectory();
    if (externalDir != null) {
      directories.add(externalDir);
    }

final libDir = await getLibraryDirectory();
    if (libDir != null) {
      directories.add(libDir);
    }

final tempDir = await getTemporaryDirectory();
    if (tempDir != null) {
      directories.add(tempDir);
    }

    return directories;
  }

Future<List<File>> _searchDirectoryForMp3Files(Directory directory) async {
    List<File> mp3Files = [];
    final List<FileSystemEntity> entities = directory.listSync(recursive: true);

    for (var entity in entities) {
      if (entity is File && p.extension(entity.path).toLowerCase() == '.mp3') {
        mp3Files.add(entity);
      }
    }

    return mp3Files;
  }
}
