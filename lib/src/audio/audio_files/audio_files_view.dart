import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'audio_files_controller.dart';
import '../../routes/app_pages.dart';
import '../../core/widgets/icon_buttons.dart';
import '../../core/string_utils.dart';

class AudioFilesView extends StatelessWidget {
  const AudioFilesView({
    super.key,
  });

  final double paddingValue = 8.0;

  @override
  Widget build(context) {
    final AudioFilesController c = Get.find();

    //const double padding = 8.0;
    //final double adjustedWidth = Get.width - 2 * padding;
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
          title: Obx(() => Text("${c.task.value?.title}")),
          actions: <Widget>[
            // wysiwyg_rounded
            DebugIconButton(
              route: Routes.DEBUG,
            ), // DebugIconButton
          ]),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            width: Get.width,
            height: Get.width / 1.618 / 3,
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
            child: Obx(() => Text(c.message.value ?? '',
                style: textTheme.bodyLarge!.copyWith(
                  color: colorScheme.onPrimaryFixed,
                ))),
          ), // Container
          Obx(
            () {
              if (c.audioFiles.isEmpty) {
                return Expanded(
                  child: Align(
                    alignment: Alignment.center,
                    child: Center(child: Text('No audio files found.')),
                  ),
                );
              } else {
                return Expanded(
                  child: MediaQuery.removePadding(
                    context: context,
                    removeTop: true,
                    child: ListView.builder(
                      itemCount: c.audioFiles.length,
                      itemBuilder: (context, index) {
                        final file = c.audioFiles[index];
                        return AudioCardItem(
                          audioFile: file,
                        ); // AudioCardItem
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
        icon: const Icon(Icons.playlist_add),
        label: Text('Add audio file'),
        onPressed: c.pickFile,
      ),
    );
  }
}

class AudioCardItem extends StatelessWidget {
  AudioCardItem({required this.audioFile});

  final File audioFile;

  @override
  Widget build(context) {
    return InkWell(
      onTap: () => Get.toNamed(
        Routes.MP3_FILE,
        arguments: audioFile,
      ),
      child: Card(
        child: ListTile(
          leading: Icon(Icons.audiotrack_outlined),
          title: Text(
            "${audioFile.path.split('/').last} - ${StringUtils.formatBytes(audioFile.lengthSync(), 1)}",
          ),
          subtitle: Text(audioFile.parent.path),
        ),
      ), // Card
    ); // InkWell
  }
}
