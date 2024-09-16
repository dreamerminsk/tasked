import 'dart:core';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';
import 'package:nanoid2/nanoid2.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import '../../debug/debug_controller.dart';
import '../../tasklist/task/task_item.dart';

class DexFilesController extends GetxController {
  final id = nanoid();
  final started = DateTime.now();
  final DebugController debug = Get.find(tag: 'debugger');
  final task = Rxn<TaskItem>();
  final dexfile = Rxn<File>();
  final dexFiles = <File>[].obs;
  var dexBytes = 0.obs;
  final limiter = RateLimiter();
  final message = Rxn<String>();

  @override
  void onInit() {
    super.onInit();
    debug.logInit(runtimeType.toString(), id, started);
  }

  @override
  void onReady() {
    super.onReady();
    task.value = Get.arguments;
    searchForDexFiles();
  }

  @override
  void onClose() {
    debug.logClose(runtimeType.toString(), id, DateTime.now());
    super.onClose();
  }

  Future<void> pickFile() async {
    try {
      final result = await FilePicker.platform.pickFiles();
      if (result != null) {
        mp3file.value = File(result.files.single.path!);
        await searchForDexFiles();
      } else {
        _updateMessage('FilePicker cancelled...');
      }
    } catch (e) {
      _updateMessage('$e');
    }
  }

  Future<void> searchForDexFiles() async {
    final directories = await _getDirectoriesToSearch();
    _updateMessage('directories = ${directories.length}');
    final foundFiles =
        await Future.wait(directories.map(_searchDirectoryForDexFiles));
    final uniquePaths = dexFiles.map((f) => f.path).toSet();

    for (var files in foundFiles) {
      for (var file in files) {
        if (uniquePaths.add(file.path)) {
          dexFiles.add(file);
          dexBytes.value += file.lengthSync();
        }
      }
    }
    _updateMessage('dexFiles = ${dexFiles.length}');
  }

  Future<List<Directory>> _getDirectoriesToSearch() async {
    final futures = [
      _getDirectory(getApplicationCacheDirectory()),
      _getDirectory(getApplicationDocumentsDirectory()),
      _getDirectory(getApplicationSupportDirectory()),
      _getDirectory(getDownloadsDirectory()),
      _getFirstDirectory(getExternalCacheDirectories()),
      _getFirstDirectory(getExternalStorageDirectories()),
      _getDirectory(getExternalStorageDirectory()),
      _getDirectory(getLibraryDirectory()),
      _getDirectory(getTemporaryDirectory()),
    ];
    final directories = await Future.wait(futures);
    return directories.whereType<Directory>().toList();
  }

  Future<Directory?> _getDirectory(Future<Directory?> future) async {
    try {
      return await future;
    } catch (e) {
      _updateMessage('$e');
      return null;
    }
  }

  Future<Directory?> _getFirstDirectory(Future<List<Directory>?> future) async {
    try {
      final directories = await future;
      return directories?.isNotEmpty == true ? directories?.first : null;
    } catch (e) {
      _updateMessage('$e');
      return null;
    }
  }

  Future<List<File>> _searchDirectoryForMp3Files(Directory directory) async {
    _updateMessage('Searching in ${directory.path}');
    final entities = await directory.list(recursive: true).toList();
    return entities
        .whereType<File>()
        .where((file) => p.extension(file.path).toLowerCase() == '.dex')
        .toList();
  }

  void _updateMessage(String msg) {
    limiter.doAction(() {
      message.value = msg;
    });
  }
}

class RateLimiter {
  final int waitTimeMilliseconds = 500;
  DateTime lastActionTime = DateTime.now();

  Future<void> doAction(Function action) async {
    while (DateTime.now().isBefore(
        lastActionTime.add(Duration(milliseconds: waitTimeMilliseconds)))) {
      await Future.delayed(const Duration(milliseconds: 100));
    }
    lastActionTime = DateTime.now();
    action();
  }
}
