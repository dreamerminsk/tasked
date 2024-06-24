import 'dart:async';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

import 'requested_path.dart';
import 'requested_paths.dart';

class PathListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> paths = [
      {
        'name': 'ApplicationCacheDirectory',
        'request': Future.delayed(
            const Duration(seconds: 1), () => getApplicationCacheDirectory()),
        'isList': false
      },
      {
        'name': 'ApplicationDocumentsDirectory',
        'request': Future.delayed(const Duration(seconds: 2),
            () => getApplicationDocumentsDirectory()),
        'isList': false
      },
      {
        'name': 'ApplicationSupportDirectory',
        'request': Future.delayed(
            const Duration(seconds: 3), () => getApplicationSupportDirectory()),
        'isList': false
      },
      {
        'name': 'DownloadsDirectory',
        'request': Future.delayed(
            const Duration(seconds: 4), () => getDownloadsDirectory()),
        'isList': false
      },
      {
        'name': 'ExternalCacheDirectories',
        'request': Future.delayed(
            const Duration(seconds: 5), () => getExternalCacheDirectories()),
        'isList': true
      },
      {
        'name': 'ExternalStorageDirectories',
        'request': Future.delayed(
            const Duration(seconds: 6), () => getExternalStorageDirectories()),
        'isList': true
      },
      {
        'name': 'ExternalStorageDirectory',
        'request': Future.delayed(
            const Duration(seconds: 7), () => getExternalStorageDirectory()),
        'isList': false
      },
      {
        'name': 'LibraryDirectory',
        'request': Future.delayed(
            const Duration(seconds: 8), () => getLibraryDirectory()),
        'isList': false
      },
      {
        'name': 'TemporaryDirectory',
        'request': Future.delayed(
            const Duration(seconds: 9), () => getTemporaryDirectory()),
        'isList': false
      },
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('path_provider 2.1.3')),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 8),
        itemCount: paths.length,
        itemBuilder: (context, index) {
          final path = paths[index];
          final padding = EdgeInsets.fromLTRB(
              index.isEven ? 24 : 8, 8, index.isEven ? 8 : 24, 8);

          return Padding(
            padding: padding,
            child: path['isList']
                ? RequestedPaths(name: path['name'], request: path['request'])
                : RequestedPath(name: path['name'], request: path['request']),
          );
        },
      ),
    );
  }
}
