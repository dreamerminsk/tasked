import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'mp3_controller.dart';
import '../routes/app_pages.dart';
import '../core/widgets/icon_buttons.dart';

class Mp3View extends StatelessWidget {
  const Mp3View({
    super.key,
  });

  final double paddingValue = 8.0;

  @override
  Widget build(context) {
    final Mp3Controller c = Get.find();

    const double padding = 8.0;
    final double adjustedWidth = Get.width - 2 * padding;

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
          Obx(() => Text('${c.mp3file.value?.toString()}')), // Obx
          Expanded( 
child: Align(
alignment: Alignment.center,
child: IconButton.outlined(
            style: const ButtonStyle(
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
            constraints: BoxConstraints(
              maxWidth: adjustedWidth,
              minWidth: adjustedWidth,
              maxHeight: adjustedWidth,
              minHeight: adjustedWidth,
            ),
            iconSize: adjustedWidth,
            icon: const Icon(Icons.blur_on),
            onPressed: () {c.pickFile();},
          ), // IconButton
), // Align
), // Expanded
        ], // children
      ), // Column
    );
  }
}
