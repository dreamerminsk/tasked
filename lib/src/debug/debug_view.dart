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

      body: const Center(child: Text('NOT IMPLEMENTED')),
    );
  }

}
