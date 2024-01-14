import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'src/debug/debug_binding.dart';
import 'src/routes/app_pages.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  //static NamedColor seedColor;
  
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
          title: 'kb-app',
          theme: ThemeData(
            useMaterial3: true,
            //primarySwatch: Colors.indigo,
            colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.primaries[Random().nextInt(Colors.primaries.length)],
            ),
          ),
          initialBinding: DebugBinding(),
          initialRoute: AppPages.INITIAL,
          getPages: AppPages.routes,
        );
  }
}
