import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'parent_dir.dart';
import 'sample_dir.dart';

class DirPage extends StatelessWidget {
  final path;
  final Rxn<FileStat> stat = Rxn<FileStat>();
  final RxList entries = RxList();

  DirPage({super.key, required this.path});

  @override
  Widget build(context) {
    //final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    if (entries.isEmpty) {
      final d = Directory(path);
      d.stat().then( (value) => stat.value = value );
      d.list().map((item) => item.path).forEach((item) => entries.add(item));
    }
    
    return Scaffold(
      body: ObxValue((data) =>
        ListView.builder(
          itemCount: data.length + 1,
          itemBuilder: (BuildContext context, int index) {
            return index == 0
            ? Padding(
              padding: EdgeInsets.fromLTRB(4, 0, 4, 16),
              child: ParentDir(
                title: path,
                onTap: () => showModalBottomSheet<void>(
                  context: context,
                  builder: _buildSheet,
                ),
              ), // SampleDir
            ) // Padding
            : Padding(
              padding: index.isEven
                ? EdgeInsets.fromLTRB(0, 8, 24, 8)
                : EdgeInsets.fromLTRB(24, 8, 0, 8),
              child: SampleDir(
                index: index,
                title: data[index - 1],
                background: colorScheme.primaryContainer,
                foreground: colorScheme.onPrimaryContainer,
              ), // SampleDir
            ); // Padding
          },
        ),
        entries,
      ),
      );
  }

  Widget _buildSheet(BuildContext context) {
    return SizedBox(
      height: 320,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text('accessed: ${stat.value?.accessed}'),
          Text('changed: ${stat.value?.changed}'),
          Text('modified: ${stat.value?.modified}'),
          Text('mode: ${stat.value?.mode}, ${stat.value?.modeString()}'),
          Text('size: ${stat.value?.size}'),
          Text('type: ${stat.value?.type}'),
        ],
      ), // Column
    );
  }

}