import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'dex_file_controller.dart';
import '../../routes/app_pages.dart';
import '../../core/widgets/icon_buttons.dart';

class DexFileView extends StatelessWidget {
  const DexFileView({
    super.key,
  });

  final double paddingValue = 8.0;

  @override
  Widget build(context) {
    final DexFileController c = Get.find();

    //const double padding = 8.0;
    //final double adjustedWidth = Get.width - 2 * padding;
    //final textTheme = Theme.of(context).textTheme;
    //final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
          title: Obx(
              () => Text('${c.dexFile.value?.path.split("/").last ?? "~^~"}')),
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
              if (c.codeFiles.isEmpty) {
                return Expanded(
                  child: Align(
                    alignment: Alignment.center,
                    child: Center(child: Text('No code files found.')),
                  ),
                );
              } else {
                return Expanded(
                  child: MediaQuery.removePadding(
                    context: context,
                    removeTop: true,
                    child: ListView.builder(
                      itemCount: c.codeFiles.length,
                      itemBuilder: (context, index) {
                        final file = c.codeFiles[index];
                        return CodeCardItem(
                          codeFile: file,
                        ); // CodeCardItem
                      },
                    ),
                  ),
                );
              }
            },
          ), // Obx
        ], // children
      ), // Column
    );
  }
}
