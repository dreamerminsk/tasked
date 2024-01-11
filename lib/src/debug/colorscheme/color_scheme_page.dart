import 'package:flutter/material.dart';
import 'package:get/get.dart';

//import '../debug_controller.dart';

class ColorSchemePage extends StatelessWidget {

  @override
  Widget build(context) {
    //final DebugController c = Get.find(tag: 'debugger');
    //final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      body: ListView(
        //padding: EdgeInsets.all(8),
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(16),
            child: Material(
              elevation: 4,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
              child: Container(
                width: Get.width,
                height: 96,
                //child: Placeholder(),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ), // BorderRadius
                  color: colorScheme.primary,
                ), // BoxDecoration
              ), // Container
            ), // Material
          ), // Padding
        ],
      ), // ListView
    );
  }

}
