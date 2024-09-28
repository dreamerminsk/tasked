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
          title: Obx(() => Text(
              '${c.dexFile.value?.path.split("/").last ?? "~^~"}')),
          actions: <Widget>[
            DebugIconButton(
              route: Routes.DEBUG,
            ), // DebugIconButton
          ]),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
                      Card(
             child: ListTile(
                title: Text('HEADER'),
                subtitle: Text('pos: 0, size: 0'),
                isThreeLine: true,
             ), // ListTile
          ), // Card
                    Card(
             child: ListTile(
                title: Text('STRING_IDS'),
                subtitle: Text('pos: 0, size: 0'),
                isThreeLine: true,
             ), // ListTile
          ), // Card
        ], // children
      ), // Column
    );
  }
}
