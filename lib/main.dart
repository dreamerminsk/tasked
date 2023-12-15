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
            useMaterial3: true,
            //primarySwatch: Colors.indigo,
            colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.indigo,
            ),
          ),
          home: CatsView(),
        );
  }
}
