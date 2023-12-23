import 'dart:convert';

import 'package:flutter_json_viewer/flutter_json_viewer.dart';
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
                    c.copyToClipboard();
                  },
                )
              ]),

      body: const Center(child: Text('NOT IMPLEMENTED')),
    );
  }

}
