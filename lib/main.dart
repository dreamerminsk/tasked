import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'src/views/cats_view.dart';
import 'src/routes/app_pages.dart';

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
          initialRoute: AppPages.INITIAL,
          getPages: AppPages.routes,
        );
  }
}
