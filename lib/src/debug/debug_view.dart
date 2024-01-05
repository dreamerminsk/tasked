import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'debug_controller.dart';

class DebugView extends StatelessWidget {

  @override
  Widget build(context) {
    final DebugController c = Get.find();
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

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
            c.started.value?.toString() ?? 'NOT IMPLEMENTED',
            style: textTheme.displaySmall!
              .copyWith(
                color: colorScheme.onSecondaryContainer
              ),
          )), // Text
        ), // Center
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(30),
          ), // BorderRadius
          color: Theme.of(context).colorScheme.secondaryContainer,
        ), // BoxDecoration
      ), //Container
    );
  }

}
