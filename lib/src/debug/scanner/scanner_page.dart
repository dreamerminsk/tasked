import 'package:flutter/material.dart';
import 'package:get/get.dart';

//import 'scanner_controller.dart';

class ScannerPage extends StatelessWidget {

  const ScannerPage({
    super.key,
  });
  
  @override
  Widget build(context) {
    //final ScannerController c = Get.find();
    //final textTheme = Theme.of(context).textTheme;
    //final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: Text('SCANNER'),
      ),
      body: Container(
        margin: EdgeInsets.all(8.0),
        width: Get.width,
        height: Get.height,
        child: Center(
          child: Text('NOT IMPLEMENTED'),
        ),
      ), //Container
    );
  }

}
