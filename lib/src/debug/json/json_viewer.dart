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
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: Obx(() => Text(c.source.value.split('/').last)),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          if (c.error.value != null)
            ...[ErrorWidget(
              error: c.error.value,
            ),
                          const SizedBox(height: 16.0),
            ],
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
                      padding: EdgeInsets.fromLTRB(8, 8, 8, 8), // EdgeInsets
                      child: Card(
                        child: ListTile(
                          leading: Icon(Icons.data_object),
                          title: Text('${node.runtimeType}'),
                          subtitle: Text('level: ${node.level}, offset: ${node.offset}, length: ${node.length}'),
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



class ErrorWidget extends StatelessWidget {
  final Object error;

  const ErrorWidget({
    Key? key,
    required this.error,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Card(
        color: Colors.redAccent,
        elevation: 4.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ), // RoundedRectangleBorder
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.error,
                color: Colors.white,
                size: 48.0,
              ),
              const SizedBox(height: 16.0),
              Text(
                error.runtimeType.toString(),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16.0),
              Text(
                error.toString(),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ), // Column
        ), // Padding
      ), // Card
    ); // Padding
  }
}
