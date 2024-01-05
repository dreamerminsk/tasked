import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'debug_controller.dart';

class DebugView extends StatelessWidget {

  @override
  Widget build(context) {
    final DebugController c = Get.find();

    return Scaffold(
      appBar: AppBar(
        title: const Text('DEBUG'),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.copy),
            onPressed: () { 
                    
            },
          )
        ]),

      body: Container(
        width: Get.width,
        height: 200,
        child: Center(
          child: Obx(() => Text(
            c.value?.started.toString() ?? 'NOT IMPLEMENTED',
            style: TextStyle(
              fontSize: 24,
              color: Theme.of(context).colorScheme.onSecondaryContainer,
            ), // TextStyle
          )), // Text
        ), // Center
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(40),
          ), // BorderRadius
          color: Theme.of(context).colorScheme.secondaryContainer,
        ), // BoxDecoration
      ), //Container
    );
  }

}
