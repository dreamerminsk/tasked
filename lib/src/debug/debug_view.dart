import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'debug_controller.dart';
import 'files/root_list_card.dart';
import 'files/path_provider_card.dart';
import 'widgets/color_scheme_widget.dart';
import 'widgets/scanner_widget.dart';
import 'widgets/health_widget.dart';
import 'widgets/network_stats.dart';
import 'widgets/random_json_files.dart';
import 'widgets/text_theme_widget.dart';
import 'widgets/new_color_scheme_widget.dart';

class DebugView extends StatelessWidget {
  @override
  Widget build(context) {
    final DebugController c = Get.find(tag: 'debugger');
    //final textTheme = Theme.of(context).textTheme;
    //final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(title: const Text('DEBUG'), actions: <Widget>[]),

      body: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(24, 8, 8, 8),
            child: HealthWidget(),
          ), // Padding
          Padding(
            padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
            child: Obx(() => NetworkStats(
                  started: c.debugStarted.value ?? DateTime.now(),
                  requests: c.requests.value,
                  rpm: c.rpm,
                  received: c.received.value,
                  lastRes: Map.from(c.lastResponse),
                )),
          ), // Padding
          Padding(
            padding: EdgeInsets.fromLTRB(8, 8, 24, 8),
            child: Obx(() => RandomJsonFiles(
                  jsonFiles: List<String>.from(c.samples),
                )),
          ), // Padding
          Padding(
            padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
            child: NewColorSchemeWidget(),
          ), // Padding
          Padding(
            padding: EdgeInsets.fromLTRB(24, 8, 8, 8),
            child: RootListCard(),
          ), // Padding
          Padding(
            padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
            child: PathProviderCard(),
          ), // Padding
          Padding(
            padding: EdgeInsets.fromLTRB(8, 8, 24, 8),
            child: ColorSchemeWidget(),
          ), // Padding
          Padding(
            padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
            child: TextThemeWidget(),
          ), // Padding
          Padding(
            padding: EdgeInsets.fromLTRB(24, 8, 8, 8),
            child: ScannerWidget(),
          ), // Padding
        ],
      ), // ListView
    );
  }
}
