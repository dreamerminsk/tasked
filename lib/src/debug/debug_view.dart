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
          child: Text('NOT IMPLEMENTED',),
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40),
            topRight: Radius.circular(40),
          ), // BorderRadius
          color: Theme.of(context).colorScheme.secondaryContainer,
        ), // BoxDecoration
      ), //Container
    );
  }

}
