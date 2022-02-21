import 'dart:io';

//import 'package:html/dom.dart' as dom;
import 'package:html/parser.dart';

import 'package:test/test.dart';

void main() {
  final file = new File('data/index.html');
  
  test('index.html is exists', ()  { 
    expect(file.existsSync(), true);
  }
  
  final htmlString = file.readAsStringSync();
  
  test('index.html is readable', ()  { 
    expect(htmlString.length, greaterThan(0));
  }
  
  test('index.html is parceable', ()  {    
    var document = parse(htmlString);
    expect(document.toString(), '#document');
    
    var rows = document.querySelectorAll('div.schedule__brick');
    expect(rows.length, 4);
  });
}
