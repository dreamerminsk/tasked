import 'package:flutter/material.dart';

import 'package:kb_dart/src/widgets/year_box_office_page.dart';
import 'package:provider/provider.dart';

import 'package:get/get.dart';

import 'src/widgets/box_office_page.dart';
import 'src/widgets/thursday_box_office_page.dart';
import 'src/widgets/weekend_box_office_page.dart';

import 'src/views/home_view.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
          title: 'kb-app',
          theme: ThemeData(
            primarySwatch: Colors.indigo,
          ),
          home: HomeView(),
        );
  }
}
