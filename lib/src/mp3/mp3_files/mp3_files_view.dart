import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'mp3_files_controller.dart';
import '../../routes/app_pages.dart';
import '../../core/widgets/icon_buttons.dart';

class Mp3FilesView extends StatelessWidget {
  const Mp3FilesView({
    super.key,
  });

  final double paddingValue = 8.0;

  @override
  Widget build(context) {
    final Mp3FilesController c = Get.find();

    //const double padding = 8.0;
    //final double adjustedWidth = Get.width - 2 * padding;
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
          title: Obx(() => Text("${c.task.value?.title}")),
          actions: <Widget>[
            DebugIconButton(
              route: Routes.DEBUG,
            ), // DebugIconButton
          ]),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            width: Get.width,
            height: Get.width / 1.618 / 2,
            padding: EdgeInsets.all(16.0),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: colorScheme.primaryFixed,
              border: Border(
                top: BorderSide(
                  color: colorScheme.primary,
                  width: 1.0,
                ), // BorderSide
                bottom: BorderSide(
                  color: colorScheme.primary,
                  width: 1.0,
                ), // BorderSide
              ), // Border
            ), // BoxDecoration
            child: Obx(() => Text(c.mp3Files.length.toString(),
                style: textTheme.bodyLarge!.copyWith(
                  color: colorScheme.onPrimaryFixed,
                ))),
          ), // Container
          Obx(
            () {
              if (c.mp3Files.isEmpty) {
                return Expanded(
                  child: Align(
                    alignment: Alignment.center,
                    child: Center(child: Text('No MP3 files found.')),
                  ),
                );
              } else {
                return Expanded(
                  child: MediaQuery.removePadding(
                    context: context,
                    removeTop: true,
                    child: ListView.builder(
                      itemCount: c.mp3Files.length,
                      itemBuilder: (context, index) {
                        final file = c.mp3Files[index];
                        return Card(
                          child: ListTile(
                            title: Text(
                              file.path.split('/').last,
                            ),
                            subtitle: Text(file.parent.path),
                          ),
                        ); // Card
                      },
                    ),
                  ),
                );
              }
            },
          ), // Obx
        ], // children
      ), // Column
      floatingActionButton: FloatingActionButton.extended(
        icon: const Icon(Icons.audiotrack_outlined),
        label: Text('Add'),
        onPressed: c.pickFile,
      ),
    );
  }
}
