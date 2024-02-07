import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'debug_controller.dart';
import 'files/files.dart';
import 'widgets/color_scheme_widget.dart';
import 'widgets/scanner_widget.dart';
import 'widgets/health_widget.dart';
import 'widgets/network_stats.dart';
import 'widgets/random_json_files.dart';
import 'widgets/text_theme_widget.dart';
import 'widgets/theme_data_widget.dart';

class DebugView extends StatelessWidget {
  @override
  Widget build(context) {
    final DebugController c = Get.find(tag: 'debugger');
    //final textTheme = Theme.of(context).textTheme;
    //final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(title: const Text('DEBUG'), actions: <Widget>[]),

      body: ListView(
        //padding: EdgeInsets.all(8),
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(20, 4, 4, 4),
            child: Obx(() => HealthWidget(
                  started: c.started.value ?? DateTime.now(),
                  instances: c.instances.value,
                  maxIns: c.maxIns.value,
                )),
          ), // Padding
          Padding(
            padding: EdgeInsets.fromLTRB(4, 4, 20, 4),
            child: Obx(() => NetworkStats(
                  started: c.started.value ?? DateTime.now(),
                  requests: c.requests.value,
                  rpm: c.rpm,
                  received: c.received.value,
                  lastRes: Map.from(c.lastResponse),
                )),
          ), // Padding
          Padding(
            padding: EdgeInsets.fromLTRB(20, 4, 4, 4),
            child: Obx(() => RandomJsonFiles(
                  jsonFiles: List<String>.from(c.samples),
                )),
          ), // Padding
          Padding(
            padding: EdgeInsets.fromLTRB(4, 4, 20, 4),
            child: ThemeDataWidget(),
          ), // Padding
          Padding(
            padding: EdgeInsets.fromLTRB(20, 4, 4, 4),
            child: Files(),
          ), // Padding
          Padding(
            padding: EdgeInsets.fromLTRB(4, 4, 20, 4),
            child: ColorSchemeWidget(),
          ), // Padding
          Padding(
            padding: EdgeInsets.fromLTRB(20, 4, 4, 4),
            child: TextThemeWidget(),
          ), // Padding
          Padding(
            padding: EdgeInsets.fromLTRB(4, 4, 20, 4),
            child: ScannerWidget(),
          ), // Padding
        ],
      ), // ListView
    );
  }
}
