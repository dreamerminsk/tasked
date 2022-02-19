import 'dart:io';

import 'package:html/dom.dart' as dom;
import 'package:html/parser.dart';

import 'package:test/test.dart';

void main() {
  test('index.html is exists', ()  {
    final file = new File('data/index.html');
    final htmlString = file.readAsStringSync();
    expect(htmlString.length > 0, true);
    
    var document = parse(htmlString);
    expect(document.toString(), '#document');
  });
}
