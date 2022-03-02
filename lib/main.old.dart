import 'package:flutter/material.dart';

import 'package:kb_dart/src/widgets/year_box_office_page.dart';
import 'package:provider/provider.dart';

import 'src/widgets/box_office_page.dart';
import 'src/widgets/thursday_box_office_page.dart';
import 'src/widgets/weekend_box_office_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<BottomNavigationBarProvider>(
              create: (context) => BottomNavigationBarProvider()),
          ChangeNotifierProvider<YearModel>(create: (context) => YearModel()),
          ChangeNotifierProvider<WeekendModel>(
              create: (context) => WeekendModel()),
          ChangeNotifierProvider<ThursdayModel>(
              create: (context) => ThursdayModel()),
        ],
        child: MaterialApp(
          title: 'kb-app',
          theme: ThemeData(
            primarySwatch: Colors.indigo,
          ),
          home: BoxOfficePage(),
        ));
  }
}
