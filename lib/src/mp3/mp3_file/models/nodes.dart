abstract interface class Node {
  List<Node> childNodes();

  String nodeName();

  Node parentNode();
}
