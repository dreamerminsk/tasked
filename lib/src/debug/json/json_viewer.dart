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
    final textTheme = Theme.of(context).textTheme;
    //final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: Obx(() => Text(c.jsonRef.value.split('/').last)),
      ),

      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.white,
        child: Column(
          children: <Widget>[
            Container(
              width: Get.width,
              height: 160,
              color: Theme.of(context).colorScheme.surfaceVariant,
              child: Stack(
                clipBehavior: Clip.none,
                children: <Widget>[
                  Container(
                    width: Get.width,
                    height: 100,
                    color: Theme.of(context).colorScheme.primaryContainer,
                  ),
                  Positioned(
                    bottom: -8,
                    left: 20,
                    right: 20,
                    child: Container(
                      color: Theme.of(context).colorScheme.primary,
                      child: Text(
                        'JSON Object',
                        style: Theme.of(context).textTheme.bodyLarge!
                        .copyWith(color: Theme.of(context).colorScheme.onPrimary),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Obx(() => 
            Text(
              'objects: ${c.lobjects.map((it) => '$it').toList().join(', ')},\narrays: ${c.larrays.map((it) => '$it').toList().join(', ')}',
              style: textTheme.titleLarge!,
            )),
          ],
        ), // Column
      ),
    );
  }

}
