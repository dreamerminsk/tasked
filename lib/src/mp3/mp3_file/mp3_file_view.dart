import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'mp3_file_controller.dart';
import '../../routes/app_pages.dart';
import '../../core/widgets/icon_buttons.dart';

class Mp3FileView extends StatelessWidget {
  const Mp3FileView({
    super.key,
  });

  final double paddingValue = 8.0;

  @override
  Widget build(context) {
    final Mp3FileController c = Get.find();

    //const double padding = 8.0;
    //final double adjustedWidth = Get.width - 2 * padding;
    //final textTheme = Theme.of(context).textTheme;
    //final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
          title: Text(
              'Mp3FileView: ${c.mp3file.value?.path.split("/").last} ?? "~^~"'),
          actions: <Widget>[
            DebugIconButton(
              route: Routes.DEBUG,
            ), // DebugIconButton
          ]),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Obx(() => c.header.value == null
                  ? ListTile(
                      title:
                          Text(c.mp3file.value?.path.split('/').last ?? '~^~'),
                      subtitle: Text(
                          'pos: 0, size: ${c.mp3file.value?.lengthSync() ?? 0}'),
                    )
                  : ListTile(
                      title: Text(c.header.runtimeType.toString()),
                      subtitle: Text(
                          'pos: 0, size: ${10 + (c.header.value?.size ?? 0)}'),
                    ) // Card
              ), // Obx
        ], // children
      ), // Column
    );
  }
}
