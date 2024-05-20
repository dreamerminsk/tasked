import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'src/debug/debug_binding.dart';
import 'src/routes/app_pages.dart';
import 'src/core/colors.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  static NamedMaterialColor seedColor = NamedColors.indigo;
  static NamedColor shadeColor = NamedColors.indigo.shade500;

  @override
  Widget build(BuildContext context) {
    seedColor =
        NamedColors.primaries[Random().nextInt(NamedColors.primaries.length)];
    var shades = [
      seedColor.shade50,
      seedColor.shade100,
      seedColor.shade200,
      seedColor.shade300,
      seedColor.shade400,
      seedColor.shade500,
      seedColor.shade600,
      seedColor.shade700,
      seedColor.shade800,
      seedColor.shade900,
    ];
    shades.shuffle();
    shadeColor = shades[0];

    return GetMaterialApp(
      title: 'tasked',
      theme: ThemeData(
        useMaterial3: true,
        //primarySwatch: Colors.indigo,
        colorScheme: ColorScheme.fromSeed(
          seedColor: shadeColor.color,
        ),
      ),
      initialBinding: DebugBinding(),
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    );
  }
}
