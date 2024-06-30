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
    final List<Future<Directory?>> futures = [
      _getDirectory(
          getApplicationCacheDirectory(), 'getApplicationCacheDirectory'),
      _getDirectory(getApplicationDocumentsDirectory(),
          'getApplicationDocumentsDirectory'),
      _getDirectory(
          getApplicationSupportDirectory(), 'getApplicationSupportDirectory'),
      _getDirectory(getDownloadsDirectory(), 'getDownloadsDirectory'),
      _getDirectories(
          getExternalCacheDirectories(), 'getExternalCacheDirectories'),
      _getDirectories(
          getExternalStorageDirectories(), 'getExternalStorageDirectories'),
      _getDirectory(
          getExternalStorageDirectory(), 'getExternalStorageDirectory'),
      _getDirectory(getLibraryDirectory(), 'getLibraryDirectory'),
      _getDirectory(getTemporaryDirectory(), 'getTemporaryDirectory'),
    ];

    final List<Directory?> directories = await Future.wait(futures);

    return directories.whereType<Directory>().toList();
  }

  Future<Directory?> _getDirectory(
      Future<Directory?> future, String name) async {
    try {
      final directory = await future;
      return directory;
    } catch (e) {
      Get.snackbar(name, '$e', snackPosition: SnackPosition.BOTTOM);
      return null;
    }
  }

  Future<Directory?> _getDirectories(
      Future<List<Directory>?> future, String name) async {
    try {
      final directories = await future;
      if (directories != null && directories.isNotEmpty) {
        return directories.first;
      }
    } catch (e) {
      Get.snackbar(name, '$e', snackPosition: SnackPosition.BOTTOM);
    }
    return null;
  }

  Future<List<File>> _searchDirectoryForMp3Files(Directory directory) async {
    List<File> mp3Files = [];
    final List<FileSystemEntity> entities =
        await directory.list(recursive: true).toList();

    for (var entity in entities) {
      if (entity is File && p.extension(entity.path).toLowerCase() == '.mp3') {
        mp3Files.add(entity);
      }
    }

    return mp3Files;
  }
}
