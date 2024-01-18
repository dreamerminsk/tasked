import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

//import '../debug_controller.dart';
import 'sample_dir.dart';

class DirPage extends StatelessWidget {
  final path;
  //final RxString parent = RxString();
  final RxList entries = RxList();

  DirPage({super.key, required this.path});

  @override
  Widget build(context) {
    //final DebugController c = Get.find(tag: 'debugger');
    //final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    if (entries.isEmpty) {
      final d = Directory(path);
      //parent.value = d.parent.path;
      d.list().map((item) => item.path).forEach((item) => entries.add(item));
    }
    
    return Scaffold(
      body: ObxValue((data) =>
        ListView.builder(
          itemCount: data.length + 1,
          itemBuilder: (BuildContext context, int index) {
            return index == 0
            ? Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 16),
              child: ParentDir(
                title: path,
              ), // SampleDir
            ) // Padding
            : Padding(
              padding: EdgeInsets.all(8),
              child: SampleDir(
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

}
