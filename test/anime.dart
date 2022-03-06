import 'dart:async';
import 'dart:io';

//import 'package:html/dom.dart' as dom;
import 'package:html/parser.dart';

import 'package:test/test.dart';

void main() {
  final file = new File('data/anime.wiki.json');
  
  test('anime.wiki.json is exists', ()  { 
    expect(file.existsSync(), true);
  });
  
  final jsonString = file.readAsStringSync();
  
  test('index.html is readable', ()  { 
    expect(htmlString.length, greaterThan(0));
  });
  
  final document = parse(htmlString);
  
  test('index.html is parceable', ()  {    
    expect(document.toString(), '#document');
  });
  
  test('index.html is parceable', ()  {    
    final rows = document.querySelectorAll('div.schedule__brick');
    expect(rows.length, 4);
  });
  
  test('index.html contains titleStream', ()  {    
    final rows = document.querySelectorAll('div.schedule__brick span.schedule__day');
    final titles = rows.map((el) {
	  return el.text;
	}).toList();	
	var titleStream = Stream.fromIterable(titles);

    expect(titleStream, emitsInOrder([
      'Четверг',
	  'Уик-энд',
	  'Год',
	  'Доля дистрибьюторов',
      //startsWith('Loading took'),
      //emitsAnyOf(['Succeeded!', 'Failed!']),
      //emitsDone
    ]));
  });
}
