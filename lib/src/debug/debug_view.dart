import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'debug_controller.dart';
import 'widgets/health_widget.dart';

class DebugView extends StatelessWidget {

  @override
  Widget build(context) {
    final DebugController c = Get.find();
    //final textTheme = Theme.of(context).textTheme;
    //final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('DEBUG'),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.copy),
            onPressed: () { 
                    
            },
          )
        ]),

      body: ListView(
        children: <Widget>[
          Obx(() => HealthWidget(
            started: c.started.value?.toString() ?? 'NOT IMPLEMENTED',
            requests: c.requests,
          )),
        ],
      ), // ListView
    );
  }

}
