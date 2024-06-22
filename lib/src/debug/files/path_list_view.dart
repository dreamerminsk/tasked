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
          Padding(
            padding: EdgeInsets.fromLTRB(20, 8, 8, 8),
            child: RequestedPath(
            name: 'getTemporaryDirectory',
            request: getTemporaryDirectory(),
          ), // RequestedPath
          ), // Padding
          Padding(
            padding: EdgeInsets.fromLTRB(8, 8, 20, 8),
            child: RequestedPath(
            name: 'getApplicationSupportDirectory',
            request: getApplicationSupportDirectory(),
          ), // RequestedPath
          ), // Padding
          Padding(
            padding: EdgeInsets.fromLTRB(20, 8, 8, 8),
            child: RequestedPath(
            name: 'getLibraryDirectory',
            request: getLibraryDirectory(),
          ), // RequestedPath
          ), // Padding
          Padding(
            padding: EdgeInsets.fromLTRB(8, 8, 20, 8),
            child: RequestedPath(
            name: 'getApplicationDocumentsDirectory',
            request: getApplicationDocumentsDirectory(),
          ), // RequestedPath
          ), // Padding
          Padding(
            padding: EdgeInsets.fromLTRB(20, 8, 8, 8),
            child: RequestedPath(
            name: 'getApplicationCacheDirectory',
            request: getApplicationCacheDirectory(),
          ), // RequestedPath
          ), // Padding
          Padding(
            padding: EdgeInsets.fromLTRB(8, 8, 20, 8),
            child: RequestedPath(
            name: 'getExternalStorageDirectory',
            request: getExternalStorageDirectory(),
          ), // RequestedPath
          ), // Padding
          Padding(
            padding: EdgeInsets.fromLTRB(20, 8, 8, 8),
            child: RequestedPaths(
            name: 'getExternalCacheDirectories',
            request: getExternalCacheDirectories(),
          ), // RequestedPaths
          ), // Padding
          Padding(
            padding: EdgeInsets.fromLTRB(8, 8, 20, 8),
            child: RequestedPaths(
            name: 'getExternalStorageDirectories',
            request: getExternalStorageDirectories(),
          ), // RequestedPaths
          ), // Padding
          Padding(
            padding: EdgeInsets.fromLTRB(20, 8, 8, 8),
            child: RequestedPath(
            name: 'getDownloadsDirectory',
            request: getDownloadsDirectory(),
          ), // RequestedPath
          ), // Padding
        ],
      ), // ListView
    );
  }
}
