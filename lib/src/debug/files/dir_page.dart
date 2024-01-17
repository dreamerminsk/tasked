import 'package:flutter/material.dart';
import 'package:get/get.dart';

//import '../debug_controller.dart';
import 'sample_dir.dart';

class DirPage extends StatelessWidget {
  final path;
  final entries = [].obs;

  const DirPage(super.key, required this.path);

  @override
  Widget build(context) {
    //final DebugController c = Get.find(tag: 'debugger');
    //final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    if (entries.value.isEmpty) {
      final d = Directory(path);
      d.list().map((item) => item.path).forEach((item) => entries.add(item));
    }
    
    return Scaffold(
      body: ObxValue((data) =>
        ListView.builder(
          itemCount: data.value.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: EdgeInsets.all(8),
              child: SampleDir(
                title: data.value[index],
                background: colorScheme.primary,
                foreground: colorScheme.onPrimary,
              ), // SampleDir
            ), // Padding;
          },
        ),
        entries,
      ),
      );
  }

}
