import 'dart:core';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';
import 'package:nanoid2/nanoid2.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

import '../../debug/debug_controller.dart';
import '../../tasklist/task/task_item.dart';

class Mp3FilesController extends GetxController {
  final id = nanoid();

  final started = DateTime.now();

  final DebugController debug = Get.find(tag: 'debugger');

  final task = Rxn<TaskItem>();

  final mp3file = Rxn<File>();

  final mp3Files = <File>[].obs;

  final message = Rxn<String>();

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
        await searchForMp3Files();
      } else {
        message.value = 'FilePicker cancelled...';
      }
    } catch (e) {
      message.value = '$e';
    }
  }

  Future<void> searchForMp3Files() async {
    List<Directory> directories = await _getDirectoriesToSearch();
    List<File> foundFiles = [];

    for (var dir in directories) {
      foundFiles.addAll(await _searchDirectoryForMp3Files(dir));
    }

    var uniqueFiles = Set.from(mp3Files.map((f) => f.path));
    for (var f in foundFiles) {
      if (!uniqueFiles.contains(f.path)) {
        mp3Files.add(f);
        uniqueFiles.add(f.path);
      }
    }
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
      message.value = '$e';
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
      message.value = '$e';
    }
    return null;
  }

  Future<List<File>> _searchDirectoryForMp3Files(Directory directory) async {
    message.value = '${directory.path}';
    List<File> files = [];
    final List<FileSystemEntity> entities =
        await directory.list(recursive: true).toList();

    for (var entity in entities) {
      if (entity is File && p.extension(entity.path).toLowerCase() == '.mp3') {
        files.add(entity);
      }
    }

    return files;
  }
}



class RateLimiter {
  late int waitTimeMilliseconds = 250;
  DateTime lastActionTime = DateTime.now();

  Future<Function> doAction(Function f) async {
    while (true) {
      if (DateTime.now().isAfter(lastActionTime.add(Duration(milliseconds: waitTimeMilliseconds)))) {
        break;
      } else {
        await Future.delayed(const Duration(milliseconds: 100));
      }
    }
    lastActionTime = DateTime.now();
    return f;
  }
}
