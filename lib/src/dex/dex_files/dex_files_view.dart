import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'dex_files_controller.dart';
import '../../routes/app_pages.dart';
import '../../core/widgets/icon_buttons.dart';
import '../../core/string_utils.dart';

class DexFilesView extends StatelessWidget {
  const DexFilesView({
    super.key,
  });

  final double paddingValue = 8.0;

  @override
  Widget build(context) {
    final DexFilesController c = Get.find();

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
              if (c.dexFiles.isEmpty) {
                return Expanded(
                  child: Align(
                    alignment: Alignment.center,
                    child: Center(child: Text('No DEX files found.')),
                  ),
                );
              } else {
                return Expanded(
                  child: MediaQuery.removePadding(
                    context: context,
                    removeTop: true,
                    child: ListView.builder(
                      itemCount: c.dexFiles.length,
                      itemBuilder: (context, index) {
                        final file = c.dexFiles[index];
                        return _DexCardItem(
                          mp3File: file,
                        ); // _DexCardItem
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
        label: Text('Add .dex'),
        onPressed: c.pickFile,
      ),
    );
  }
}

class _DexCardItem extends StatelessWidget {
  _DexCardItem({required this.dexFile});

  final File dexFile;

  @override
  Widget build(context) {
    return InkWell(
      onTap: () => Get.toNamed(
        Routes.DEX_FILE,
        arguments: dexFile,
      ),
      child: Card(
        child: ListTile(
          leading: Icon(Icons.audiotrack_outlined),
          title: Text(
            "${dexFile.path.split('/').last} - ${StringUtils.formatBytes(dexFile.lengthSync(), 1)}",
          ),
          subtitle: Text(dexFile.parent.path),
        ),
      ), // Card
    ); // InkWell
  }
}
