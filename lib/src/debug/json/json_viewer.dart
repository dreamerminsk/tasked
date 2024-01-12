import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'json_controller.dart';

class JsonViewer extends StatelessWidget {

  const JsonViewer({
    super.key,
  });
  
  @override
  Widget build(context) {
    final JsonController c = Get.find();
    //final textTheme = Theme.of(context).textTheme;
    //final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: Text('json-viewer'),
      ),

      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.white,
        child: Center(
          child: Obx(() => Text(c.jsonRef.value)),
        ),
      ),
    );
  }

}
