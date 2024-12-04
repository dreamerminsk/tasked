import 'package:flutter/material.dart' hide ErrorWidget;
import 'package:get/get.dart';

import 'widgets/error_widget.dart';
import 'json_controller.dart';
import 'widgets/node_card.dart';

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
          Obx(() => (c.error.value != null)
              ? ErrorWidget(
                  error: c.error.value!,
                )
              : SizedBox.shrink()), // Obx
          Expanded(
            child: MediaQuery.removePadding(
              context: context,
              removeTop: true,
              child: Obx(
                () => ListView.builder(
                  itemCount: c.nodes.length,
                  itemBuilder: (BuildContext context, int index) {
                    final node = c.nodes.values.elementAt(index);
                    return NodeCard(
                      node: node,
                    ); // NodeCard
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
