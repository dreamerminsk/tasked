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
            width: adjustedWidth,
            height: adjustedWidth / 1.618 / 2,
            decoration: BoxDecoration(
              color: colorScheme.secondaryFixed,
              border: Border(
                top: BorderSide(
                  color: colorScheme.primary,
                  width: 2.0,
                ), // BorderSide
                bottom: BorderSide(
                  color: colorScheme.primary,
                  width: 2.0,
                ), // BorderSide
              ), // Border
            ), // BoxDecoration
            child: Obx(() => Text(c.mp3Files.length.toString())),
          ), // Container
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
                onPressed: () {
                  c.pickFile();
                },
              ), // IconButton
            ), // Align
          ), // Expanded
        ], // children
      ), // Column
    );
  }
}
