import 'package:flutter/material.dart' hide ErrorWidget;
import 'package:get/get.dart';

import 'error_widget.dart';
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
        title: Obx(() => Text(c.source.value.split('/').last)),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Obx( ()=>
               if (c.error.value != null) {
                 ErrorWidget(
              error: c.error.value!,
            );
               } else {
                  SizedBox.shrink();
               }
          ), // Obx
          Expanded(
            child: MediaQuery.removePadding(
              context: context,
              removeTop: true,
              child: Obx(
                () => ListView.builder(
                  itemCount: c.nodes.length,
                  itemBuilder: (BuildContext context, int index) {
                    final node = c.nodes.values.elementAt(index);
                    return Padding(
                      padding: EdgeInsets.fromLTRB(node.level + 8, 4, 8, 4), // EdgeInsets
                      child: Card(
                        child: ListTile(
                          leading: Icon(Icons.data_object),
                          title: Text('${node.runtimeType}'),
                          subtitle: Text(
                              'level: ${node.level}, offset: ${node.offset}, length: ${node.length}'),
                        ), // ListTile
                      ), // Card
                    ); // Padding
                  }, // itemBuilder
                ), // ListView
              ), // Obx
            ), // MediaQuery
          ), // Expanded
        ],
      ), // Column
    );
  }
}
