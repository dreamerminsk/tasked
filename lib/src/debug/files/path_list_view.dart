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
            name: 'TemporaryDirectory',
            request: getTemporaryDirectory(),
          ), // RequestedPath
          ), // Padding
          Padding(
            padding: EdgeInsets.fromLTRB(8, 8, 20, 8),
            child: RequestedPath(
            name: 'ApplicationSupportDirectory',
            request: getApplicationSupportDirectory(),
          ), // RequestedPath
          ), // Padding
          Padding(
            padding: EdgeInsets.fromLTRB(20, 8, 8, 8),
            child: RequestedPath(
            name: 'LibraryDirectory',
            request: getLibraryDirectory(),
          ), // RequestedPath
          ), // Padding
          Padding(
            padding: EdgeInsets.fromLTRB(8, 8, 20, 8),
            child: RequestedPath(
            name: 'ApplicationDocumentsDirectory',
            request: getApplicationDocumentsDirectory(),
          ), // RequestedPath
          ), // Padding
          Padding(
            padding: EdgeInsets.fromLTRB(20, 8, 8, 8),
            child: RequestedPath(
            name: 'ApplicationCacheDirectory',
            request: getApplicationCacheDirectory(),
          ), // RequestedPath
          ), // Padding
          Padding(
            padding: EdgeInsets.fromLTRB(8, 8, 20, 8),
            child: RequestedPath(
            name: 'ExternalStorageDirectory',
            request: getExternalStorageDirectory(),
          ), // RequestedPath
          ), // Padding
          Padding(
            padding: EdgeInsets.fromLTRB(20, 8, 8, 8),
            child: RequestedPaths(
            name: 'ExternalCacheDirectories',
            request: getExternalCacheDirectories(),
          ), // RequestedPaths
          ), // Padding
          Padding(
            padding: EdgeInsets.fromLTRB(8, 8, 20, 8),
            child: RequestedPaths(
            name: 'ExternalStorageDirectories',
            request: getExternalStorageDirectories(),
          ), // RequestedPaths
          ), // Padding
          Padding(
            padding: EdgeInsets.fromLTRB(20, 8, 8, 8),
            child: RequestedPath(
            name: 'DownloadsDirectory',
            request: getDownloadsDirectory(),
          ), // RequestedPath
          ), // Padding
        ],
      ), // ListView
    );
  }
}
