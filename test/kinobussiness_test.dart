import 'dart:io';

import 'package:test/test.dart';

void main() {
  test('index.html is exists', ()  {
    final file = new File('data/index.html');
    final htmlString = file.readAsStringSync();
    expect(htmlString.length > 0, true);
    //expect(messageFinder, findsOneWidget);
  });
}
