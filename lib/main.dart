import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'src/debug/debug_binding.dart';
import 'src/routes/app_pages.dart';
import 'src/core/colors.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  static NamedMaterialColor seedColor = NamedColors.indigo;
  
  @override
  Widget build(BuildContext context) {
    seedColor = NamedColors.primaries[Random().nextInt(NamedColors.primaries.length)];
    
    return GetMaterialApp(
          title: 'kb-app',
          theme: ThemeData(
            useMaterial3: true,
            //primarySwatch: Colors.indigo,
            colorScheme: ColorScheme.fromSeed(
              seedColor: seedColor.primary,
            ),
          ),
          initialBinding: DebugBinding(),
          initialRoute: AppPages.INITIAL,
          getPages: AppPages.routes,
        );
  }
}
