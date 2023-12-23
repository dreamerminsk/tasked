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
              title: 'DEBUG',
              actions: <Widget>[
                IconButton(icon: Icon(Icons.copy),
                  onPressed: () { 
                    c.copyToClipboard();
                  },
                )
              ]),

      body: Obx( () {
        final encoder = JsonEncoder.withIndent('   ');
        return _scrollable(encoder.convert(c.animeList));
      }),
    );
  }

  Widget _scrollable(String text) {
    return Row(children: <Widget>[
             Expanded(
               child: new SingleChildScrollView(
                 scrollDirection: Axis.vertical,
                   child: JsonViewer(jsonDecode(text)),
               ),
             ),]
           );
  }
}
