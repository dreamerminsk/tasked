import 'package:flutter/material.dart';

import '../nodes.dart';

class NodeCard extends StatelessWidget {
  final JsonNode node;
  final String short;

  const NodeCard({
    Key? key,
    required this.node,
    required this.short,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const double paddingLeft = 8.0;
    const double paddingRight = 8.0;
    const double paddingBottom = 4.0;
    const double paddingTop = 4.0;

    return Padding(
      padding: EdgeInsets.fromLTRB(
          node.level + paddingLeft, paddingTop, paddingRight, paddingBottom),
      child: Card(
        child: ListTile(
          leading: _getNodeIcon(node),
          title: Text('${node.runtimeType}'),
          subtitle: Text(
            'Level: ${node.level}, Offset: ${node.offset}, Length: ${node.length}\r\n${this.short}',
          ),
          isThreeLine: false,
        ),
      ),
    );
  }

  Icon _getNodeIcon(JsonNode node) {
    if (node is ObjectNode) {
      return Icon(Icons.data_object, size: 48.0);
    } else if (node is ArrayNode) {
      return Icon(Icons.data_array, size: 48.0);
    } else {
      return Icon(Icons.help, size: 48.0);
    }
  }
}
