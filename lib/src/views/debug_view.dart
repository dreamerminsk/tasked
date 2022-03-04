import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class DebugView extends StatelessWidget {

  @override
  Widget build(context) {
    final HomeController c = Get.find();

    return Scaffold(
      appBar: AppBar(title: Obx(() => Text("Anime: ${c.animeList.length}")),
              actions: <Widget>[
                Obx(() =>
                IconButton(icon: Icon(Icons.copy),
                  onPressed: () { 
                    final encoder = JsonEncoder.withIndent('   ');
                    Clipboard.setData(ClipboardData(text: encoder.convert(c.animeList)));
                  },))
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
                   child: new Text(text,),
               ),
             ),]
           );
  }
}
