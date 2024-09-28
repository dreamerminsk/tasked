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
          title: Obx(
              () => Text('${c.flacFile.value?.path.split("/").last ?? "~^~"}')),
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
              title: Text('FLAC stream marker'),
              subtitle: Text('pos: 0, size: 4'),
              isThreeLine: true,
            ), // ListTile
          ), // Card
          Card(
            child: ListTile(
              title: Text('STREAMINFO'),
              subtitle: Text('pos: 4, size: 34'),
              isThreeLine: true,
            ), // ListTile
          ), // Card
          Card(
            child: ListTile(
              title: Text('BINARY'),
              subtitle: Text('pos: 38, size: ???'),
              isThreeLine: true,
            ), // ListTile
          ), // Card
        ], // children
      ), // Column
    );
  }
}
