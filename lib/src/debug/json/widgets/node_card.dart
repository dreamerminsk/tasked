import 'package:flutter/material.dart';

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
            'Level: ${node.level}, Offset: ${node.offset}, Length: ${node.length}',
          ),
        ),
      ),
    );
  }

  Icon _getNodeIcon(JsonNode node) {
    if (node is ObjectNode) {
      return Icon(Icons.data_object);
    } else if (node is ArrayNode) {
      return Icon(Icons.data_array);
    } else {
      return Icon(Icons.help);
    }
  }
}
