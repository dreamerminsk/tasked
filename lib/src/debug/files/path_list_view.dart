import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

import 'requested_path.dart';
import 'requested_paths.dart';

class PathListView extends StatelessWidget {
  @override
  Widget build(context) {
    //final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(title: const Text('path_provider'), actions: <Widget>[]),

      body: ListView(
        padding: const EdgeInsets.all(8),
        children: <Widget>[
          RequestedPath(
            name: 'getTemporaryDirectory()',
            request: getTemporaryDirectory(),
          ), // RequestedPath
          RequestedPath(
            name: 'getApplicationSupportDirectory()',
            request: getApplicationSupportDirectory(),
          ), // RequestedPath
          RequestedPath(
            name: 'getLibraryDirectory()',
            request: getLibraryDirectory(),
          ), // RequestedPath
          RequestedPath(
            name: 'getApplicationDocumentsDirectory()',
            request: getApplicationDocumentsDirectory(),
          ), // RequestedPath
          RequestedPath(
            name: 'getApplicationCacheDirectory()',
            request: getApplicationCacheDirectory(),
          ), // RequestedPath
          RequestedPath(
            name: 'getExternalStorageDirectory()',
            request: getExternalStorageDirectory(),
          ), // RequestedPath
          RequestedPaths(
            name: 'getExternalCacheDirectories()',
            request: getExternalCacheDirectories(),
          ), // RequestedPaths
          RequestedPaths(
            name: 'getExternalStorageDirectories()',
            request: getExternalStorageDirectories(),
          ), // RequestedPaths
          RequestedPath(
            name: 'getDownloadsDirectory()',
            request: getDownloadsDirectory(),
          ), // RequestedPath
        ],
      ), // ListView
    );
  }
}
