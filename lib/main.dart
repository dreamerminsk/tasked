import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'src/views/cats_view.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
          title: 'kb-app',
          theme: ThemeData(
            primarySwatch: Colors.indigo,
          ),
          home: CatsView(),
        );
  }
}
