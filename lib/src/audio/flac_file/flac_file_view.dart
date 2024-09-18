import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'flac_file_controller.dart';
import '../../routes/app_pages.dart';
import '../../core/widgets/icon_buttons.dart';

class FlacFileView extends StatelessWidget {
  const FlacFileView({
    super.key,
  });

  final double paddingValue = 8.0;

  @override
  Widget build(context) {
    final FlacFileController c = Get.find();

    return Scaffold(
      appBar: AppBar(
          title: Obx(() => Text(
              'FlacFileView: ${c.flacFile.value?.path.split("/").last ?? "~^~"}')),
          actions: <Widget>[
            DebugIconButton(
              route: Routes.DEBUG,
            ), // DebugIconButton
          ]),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Obx(() => c.header.value == null
                  ? Card(
                      child: ListTile(
                        title: Text(
                            c.mp3file.value?.path.split('/').last ?? '~^~'),
                        subtitle: Text(
                            'pos: 0, size: ${c.mp3file.value?.lengthSync() ?? 0}'),
                        isThreeLine: true,
                      ), // ListTile
                    ) // Card
                  : Card(
                      child: ListTile(
                        title: Text(c.header.value.runtimeType.toString()),
                        subtitle: Text(
                            '${c.header.value}, pos: 0, size: ${10 + (c.header.value?.size ?? 0)}'),
                        isThreeLine: true,
                      ), // ListTile
                    ) // Card
              ), // Obx
        ], // children
      ), // Column
    );
  }
}
