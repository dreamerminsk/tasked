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
  Widget build(BuildContext context) {
  final JsonController c = Get.find();

  return Scaffold(
    appBar: AppBar(
      title: Obx(() => Text(c.source.value.split('/').last)),
    ),
    body: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Obx(() {
          if (c.error.value != null) {
            return ErrorWidget(error: c.error.value!);
          }
          return const SizedBox.shrink();
        }),
        Expanded(
          child: MediaQuery.removePadding(
            context: context,
            removeTop: true,
            child: Obx(() {
              return ListView.builder(
                itemCount: c.nodes.length,
                itemBuilder: (BuildContext context, int index) {
                  final node = c.nodes.values.elementAt(index);
                  return FutureBuilder<String>(
                    future: c.getShort(node),
                    builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
                      final short = snapshot.data ?? '...';
                      return NodeCard(
                        node: node,
                        short: short,
                      );
                    },
                  );
                },
              );
            }),
          ),
        ),
      ],
    ),
  );
}
}

