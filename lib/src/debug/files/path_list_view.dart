import 'dart:async';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

import 'requested_path.dart';
import 'requested_paths.dart';

class PathListView extends StatelessWidget {
  @override
  Widget build(context) {
    //final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar:
          AppBar(title: const Text('path_provider 2.1.3'), actions: <Widget>[]),

      body: ListView(
        padding: const EdgeInsets.all(8),
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(20, 8, 8, 8),
            child: RequestedPath(
              name: 'ApplicationCacheDirectory',
              request: Future.delayed(const Duration(seconds: 1),
                  () => getApplicationCacheDirectory()),
            ), // RequestedPath
          ), // Padding
          Padding(
            padding: EdgeInsets.fromLTRB(8, 8, 20, 8),
            child: RequestedPath(
              name: 'ApplicationDocumentsDirectory',
              request: Future.delayed(const Duration(seconds: 2),
                  () => getApplicationDocumentsDirectory()),
            ), // RequestedPath
          ), // Padding
          Padding(
            padding: EdgeInsets.fromLTRB(8, 8, 20, 8),
            child: RequestedPath(
              name: 'ApplicationSupportDirectory',
              request: Future.delayed(const Duration(seconds: 3),
                  () => getApplicationSupportDirectory()),
            ), // RequestedPath
          ), // Padding
          Padding(
            padding: EdgeInsets.fromLTRB(20, 8, 8, 8),
            child: RequestedPath(
              name: 'DownloadsDirectory',
              request: Future.delayed(
                  const Duration(seconds: 4), () => getDownloadsDirectory()),
            ), // RequestedPath
          ), // Padding
          Padding(
            padding: EdgeInsets.fromLTRB(20, 8, 8, 8),
            child: RequestedPaths(
              name: 'ExternalCacheDirectories',
              request: Future.delayed(const Duration(seconds: 5),
                  () => getExternalCacheDirectories()),
            ), // RequestedPaths
          ), // Padding
          Padding(
            padding: EdgeInsets.fromLTRB(8, 8, 20, 8),
            child: RequestedPaths(
              name: 'ExternalStorageDirectories',
              request: Future.delayed(const Duration(seconds: 6),
                  () => getExternalStorageDirectories()),
            ), // RequestedPaths
          ), // Padding
          Padding(
            padding: EdgeInsets.fromLTRB(8, 8, 20, 8),
            child: RequestedPath(
              name: 'ExternalStorageDirectory',
              request: Future.delayed(const Duration(seconds: 7),
                  () => getExternalStorageDirectory()),
            ), // RequestedPath
          ), // Padding
          Padding(
            padding: EdgeInsets.fromLTRB(20, 8, 8, 8),
            child: RequestedPath(
              name: 'LibraryDirectory',
              request: Future.delayed(
                  const Duration(seconds: 8), () => getLibraryDirectory()),
            ), // RequestedPath
          ), // Padding
          Padding(
            padding: EdgeInsets.fromLTRB(20, 8, 8, 8),
            child: RequestedPath(
              name: 'TemporaryDirectory',
              request: Future.delayed(
                  const Duration(seconds: 9), () => getTemporaryDirectory()),
            ), // RequestedPath
          ), // Padding
        ],
      ), // ListView
    );
  }
}
