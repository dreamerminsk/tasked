import 'package:flutter/material.dart';
//import 'package:get/get.dart';

//import 'debug_controller.dart';

class JsonViewer extends StatelessWidget {
  final String path;

  const JsonViewer(super.key, required this.path);
  
  @override
  Widget build(context) {
    //final DebugController c = Get.find(tag: 'debugger');
    //final textTheme = Theme.of(context).textTheme;
    //final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: 'json-viewer',
      ),

      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.white,
        child: Center(
          child: Text(path),
        ),
      ),
    );
  }

}
