import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'sample_theme.dart';
import 'sample_object.dart';

class ThemeDataPage extends StatelessWidget {

  @override
  Widget build(context) {
    //final DebugController c = Get.find(tag: 'debugger');
    final theme = Theme.of(context);
    //final textTheme = Theme.of(context).textTheme;
    //final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      body: ListView(
        //padding: EdgeInsets.all(8),
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(8),
            child: SampleTheme(
              title: 'actionIconTheme',
              theme: theme.actionIconTheme,
            ), // SampleTheme
          ), // Padding
          Padding(
            padding: EdgeInsets.all(8),
            child: SampleObject(
              title: 'appBarTheme',
              object: theme.appBarTheme,
            ), // SampleTheme
          ), // Padding
          Padding(
            padding: EdgeInsets.all(8),
            child: SampleTheme(
              title: 'badgeTheme',
              theme: theme.badgeTheme,
            ), // SampleTheme
          ), // Padding
          Padding(
            padding: EdgeInsets.all(8),
            child: SampleTheme(
              title: 'bannerTheme',
              theme: theme.bannerTheme,
            ), // SampleTheme
          ), // Padding
          Padding(
            padding: EdgeInsets.all(8),
            child: SampleTheme(
              title: 'bottomAppBarTheme',
              theme: theme.bottomAppBarTheme,
            ), // SampleTheme
          ), // Padding
          Padding(
            padding: EdgeInsets.all(8),
            child: SampleTheme(
              title: 'bottomNavigationBarTheme',
              theme: theme.bottomNavigationBarTheme,
            ), // SampleTheme
          ), // Padding
          Padding(
            padding: EdgeInsets.all(8),
            child: SampleTheme(
              title: 'bottomSheetTheme',
              theme: theme.bottomSheetTheme,
            ), // SampleTheme
          ), // Padding
          Padding(
            padding: EdgeInsets.all(8),
            child: SampleTheme(
              title: 'brightness',
              theme: theme.brightness,
            ), // SampleTheme
          ), // Padding
          Padding(
            padding: EdgeInsets.all(8),
            child: SampleTheme(
              title: 'buttonBarTheme',
              theme: theme.buttonBarTheme,
            ), // SampleTheme
          ), // Padding
          Padding(
            padding: EdgeInsets.all(8),
            child: SampleTheme(
              title: 'buttonTheme',
              theme: theme.buttonTheme,
            ), // SampleTheme
          ), // Padding
          Padding(
            padding: EdgeInsets.all(8),
            child: SampleColor(
              title: 'canvasColor',
              background: theme.canvasColor,
              foreground: invert(theme.canvasColor),
            ), // SampleColor
          ), // Padding
          Padding(
            padding: EdgeInsets.all(8),
            child: SampleColor(
              title: 'cardColor',
              background: theme.cardColor,
              foreground: invert(theme.cardColor),
            ), // SampleColor
          ), // Padding
          Padding(
            padding: EdgeInsets.all(8),
            child: SampleTheme(
              title: 'cardTheme',
              theme: theme.cardTheme,
            ), // SampleTheme
          ), // Padding
          Padding(
            padding: EdgeInsets.all(8),
            child: SampleTheme(
              title: 'checkboxTheme',
              theme: theme.checkboxTheme,
            ), // SampleTheme
          ), // Padding
          Padding(
            padding: EdgeInsets.all(8),
            child: SampleTheme(
              title: 'chipTheme',
              theme: theme.chipTheme,
            ), // SampleTheme
          ), // Padding
          Padding(
            padding: EdgeInsets.all(8),
            child: SampleTheme(
              title: 'colorScheme',
              theme: theme.colorScheme,
            ), // SampleTheme
          ), // Padding
          Padding(
            padding: EdgeInsets.all(8),
            child: SampleTheme(
              title: 'cupertinoOverrideTheme',
              theme: theme.cupertinoOverrideTheme,
            ), // SampleTheme
          ), // Padding
          Padding(
            padding: EdgeInsets.all(8),
            child: SampleTheme(
              title: 'dataTableTheme',
              theme: theme.dataTableTheme,
            ), // SampleTheme
          ), // Padding
          Padding(
            padding: EdgeInsets.all(8),
            child: SampleTheme(
              title: 'datePickerTheme',
              theme: theme.datePickerTheme,
            ), // SampleTheme
          ), // Padding
          Padding(
            padding: EdgeInsets.all(8),
            child: SampleColor(
              title: 'dialogBackgroundColor',
              background: theme.dialogBackgroundColor,
              foreground: invert(theme.dialogBackgroundColor),
            ), // SampleColor
          ), // Padding
          Padding(
            padding: EdgeInsets.all(8),
            child: SampleTheme(
              title: 'dialogTheme',
              theme: theme.dialogTheme,
            ), // SampleTheme
          ), // Padding
          Padding(
            padding: EdgeInsets.all(8),
            child: SampleColor(
              title: 'disabledColor',
              background: theme.disabledColor,
              foreground: invert(theme.disabledColor),
            ), // SampleColor
          ), // Padding
          Padding(
            padding: EdgeInsets.all(8),
            child: SampleColor(
              title: 'dividerColor',
              background: theme.dividerColor,
              foreground: invert(theme.dividerColor),
            ), // SampleColor
          ), // Padding
          Padding(
            padding: EdgeInsets.all(8),
            child: SampleTheme(
              title: 'dividerTheme',
              theme: theme.dividerTheme,
            ), // SampleTheme
          ), // Padding
          Padding(
            padding: EdgeInsets.all(8),
            child: SampleTheme(
              title: 'drawerTheme',
              theme: theme.drawerTheme,
            ), // SampleTheme
          ), // Padding
          Padding(
            padding: EdgeInsets.all(8),
            child: SampleTheme(
              title: 'dropdownMenuTheme',
              theme: theme.dropdownMenuTheme,
            ), // SampleTheme
          ), // Padding
          Padding(
            padding: EdgeInsets.all(8),
            child: SampleTheme(
              title: 'elevatedButtonTheme',
              theme: theme.elevatedButtonTheme,
            ), // SampleTheme
          ), // Padding
          Padding(
            padding: EdgeInsets.all(8),
            child: SampleTheme(
              title: 'expansionTileTheme',
              theme: theme.expansionTileTheme,
            ), // SampleTheme
          ), // Padding
          Padding(
            padding: EdgeInsets.all(8),
            child: SampleTheme(
              title: 'extensions',
              theme: theme.extensions,
            ), // SampleTheme
          ), // Padding
          Padding(
            padding: EdgeInsets.all(8),
            child: SampleTheme(
              title: 'filledButtonTheme',
              theme: theme.filledButtonTheme,
            ), // SampleTheme
          ), // Padding
          Padding(
            padding: EdgeInsets.all(8),
            child: SampleTheme(
              title: 'floatingActionButtonTheme',
              theme: theme.floatingActionButtonTheme,
            ), // SampleTheme
          ), // Padding
          Padding(
            padding: EdgeInsets.all(8),
            child: SampleColor(
              title: 'focusColor',
              background: theme.focusColor,
              foreground: invert(theme.focusColor),
            ), // SampleColor
          ), // Padding
          Padding(
            padding: EdgeInsets.all(8),
            child: SampleColor(
              title: 'highlightColor',
              background: theme.highlightColor,
              foreground: invert(theme.highlightColor),
            ), // SampleColor
          ), // Padding
          Padding(
            padding: EdgeInsets.all(8),
            child: SampleColor(
              title: 'hintColor',
              background: theme.hintColor,
              foreground: invert(theme.hintColor),
            ), // SampleColor
          ), // Padding
          Padding(
            padding: EdgeInsets.all(8),
            child: SampleColor(
              title: 'hoverColor',
              background: theme.hoverColor,
              foreground: invert(theme.hoverColor),
            ), // SampleColor
          ), // Padding
          Padding(
            padding: EdgeInsets.all(8),
            child: SampleTheme(
              title: 'iconButtonTheme',
              theme: theme.iconButtonTheme,
            ), // SampleTheme
          ), // Padding
          Padding(
            padding: EdgeInsets.all(8),
            child: SampleTheme(
              title: 'iconTheme',
              theme: theme.iconTheme,
            ), // SampleTheme
          ), // Padding
          Padding(
            padding: EdgeInsets.all(8),
            child: SampleColor(
              title: 'indicatorColor',
              background: theme.indicatorColor,
              foreground: invert(theme.indicatorColor),
            ), // SampleColor
          ), // Padding
          Padding(
            padding: EdgeInsets.all(8),
            child: SampleTheme(
              title: 'inputDecorationTheme',
              theme: theme.inputDecorationTheme,
            ), // SampleTheme
          ), // Padding
          Padding(
            padding: EdgeInsets.all(8),
            child: SampleTheme(
              title: 'listTileTheme',
              theme: theme.listTileTheme,
            ), // SampleTheme
          ), // Padding
          Padding(
            padding: EdgeInsets.all(8),
            child: SampleTheme(
              title: 'materialTapTargetSize',
              theme: theme.materialTapTargetSize,
            ), // SampleTheme
          ), // Padding
          Padding(
            padding: EdgeInsets.all(8),
            child: SampleTheme(
              title: 'menuBarTheme',
              theme: theme.menuBarTheme,
            ), // SampleTheme
          ), // Padding
          Padding(
            padding: EdgeInsets.all(8),
            child: SampleTheme(
              title: 'menuButtonTheme',
              theme: theme.menuButtonTheme,
            ), // SampleTheme
          ), // Padding
          Padding(
            padding: EdgeInsets.all(8),
            child: SampleTheme(
              title: 'menuTheme',
              theme: theme.menuTheme,
            ), // SampleTheme
          ), // Padding
          Padding(
            padding: EdgeInsets.all(8),
            child: SampleTheme(
              title: 'navigationBarTheme',
              theme: theme.navigationBarTheme,
            ), // SampleTheme
          ), // Padding
          Padding(
            padding: EdgeInsets.all(8),
            child: SampleTheme(
              title: 'navigationDrawerTheme',
              theme: theme.navigationDrawerTheme,
            ), // SampleTheme
          ), // Padding
          Padding(
            padding: EdgeInsets.all(8),
            child: SampleTheme(
              title: 'navigationRailTheme',
              theme: theme.navigationRailTheme,
            ), // SampleTheme
          ), // Padding
          Padding(
            padding: EdgeInsets.all(8),
            child: SampleTheme(
              title: 'outlinedButtonTheme',
              theme: theme.outlinedButtonTheme,
            ), // SampleTheme
          ), // Padding
          Padding(
            padding: EdgeInsets.all(8),
            child: SampleTheme(
              title: 'pageTransitionsTheme',
              theme: theme.pageTransitionsTheme,
            ), // SampleTheme
          ), // Padding
          Padding(
            padding: EdgeInsets.all(8),
            child: SampleTheme(
              title: 'platform',
              theme: theme.platform,
            ), // SampleTheme
          ), // Padding
          Padding(
            padding: EdgeInsets.all(8),
            child: SampleTheme(
              title: 'popupMenuTheme',
              theme: theme.popupMenuTheme,
            ), // SampleTheme
          ), // Padding
          Padding(
            padding: EdgeInsets.all(8),
            child: SampleColor(
              title: 'primaryColor',
              background: theme.primaryColor,
              foreground: invert(theme.primaryColor),
            ), // SampleColor
          ), // Padding
          Padding(
            padding: EdgeInsets.all(8),
            child: SampleColor(
              title: 'primaryColorDark',
              background: theme.primaryColorDark,
              foreground: invert(theme.primaryColorDark),
            ), // SampleColor
          ), // Padding
          Padding(
            padding: EdgeInsets.all(8),
            child: SampleColor(
              title: 'primaryColorLight',
              background: theme.primaryColorLight,
              foreground: invert(theme.primaryColorLight),
            ), // SampleColor
          ), // Padding
          Padding(
            padding: EdgeInsets.all(8),
            child: SampleTheme(
              title: 'primaryIconTheme',
              theme: theme.primaryIconTheme,
            ), // SampleTheme
          ), // Padding
          Padding(
            padding: EdgeInsets.all(8),
            child: SampleTheme(
              title: 'primaryTextTheme',
              theme: theme.primaryTextTheme,
            ), // SampleTheme
          ), // Padding
          Padding(
            padding: EdgeInsets.all(8),
            child: SampleTheme(
              title: 'progressIndicatorTheme',
              theme: theme.progressIndicatorTheme,
            ), // SampleTheme
          ), // Padding
          Padding(
            padding: EdgeInsets.all(8),
            child: SampleTheme(
              title: 'radioTheme',
              theme: theme.radioTheme,
            ), // SampleTheme
          ), // Padding
          Padding(
            padding: EdgeInsets.all(8),
            child: SampleColor(
              title: 'scaffoldBackgroundColor',
              background: theme.scaffoldBackgroundColor,
              foreground: invert(theme.scaffoldBackgroundColor),
            ), // SampleColor
          ), // Padding
          Padding(
            padding: EdgeInsets.all(8),
            child: SampleTheme(
              title: 'scrollbarTheme',
              theme: theme.scrollbarTheme,
            ), // SampleTheme
          ), // Padding
          Padding(
            padding: EdgeInsets.all(8),
            child: SampleTheme(
              title: 'searchBarTheme',
              theme: theme.searchBarTheme,
            ), // SampleTheme
          ), // Padding
          Padding(
            padding: EdgeInsets.all(8),
            child: SampleTheme(
              title: 'searchViewTheme',
              theme: theme.searchViewTheme,
            ), // SampleTheme
          ), // Padding
          Padding(
            padding: EdgeInsets.all(8),
            child: SampleColor(
              title: 'secondaryHeaderColor',
              background: theme.secondaryHeaderColor,
              foreground: invert(theme.secondaryHeaderColor),
            ), // SampleColor
          ), // Padding
          Padding(
            padding: EdgeInsets.all(8),
            child: SampleTheme(
              title: 'segmentedButtonTheme',
              theme: theme.segmentedButtonTheme,
            ), // SampleTheme
          ), // Padding
          Padding(
            padding: EdgeInsets.all(8),
            child: SampleColor(
              title: 'shadowColor',
              background: theme.shadowColor,
              foreground: invert(theme.shadowColor),
            ), // SampleColor
          ), // Padding
          Padding(
            padding: EdgeInsets.all(8),
            child: SampleTheme(
              title: 'sliderTheme',
              theme: theme.sliderTheme,
            ), // SampleTheme
          ), // Padding
          Padding(
            padding: EdgeInsets.all(8),
            child: SampleTheme(
              title: 'snackBarTheme',
              theme: theme.snackBarTheme,
            ), // SampleTheme
          ), // Padding
          Padding(
            padding: EdgeInsets.all(8),
            child: SampleColor(
              title: 'splashColor',
              background: theme.splashColor,
              foreground: invert(theme.splashColor),
            ), // SampleColor
          ), // Padding
          Padding(
            padding: EdgeInsets.all(8),
            child: SampleTheme(
              title: 'splashFactory',
              theme: theme.splashFactory,
            ), // SampleTheme
          ), // Padding
          Padding(
            padding: EdgeInsets.all(8),
            child: SampleTheme(
              title: 'switchTheme',
              theme: theme.switchTheme,
            ), // SampleTheme
          ), // Padding
          Padding(
            padding: EdgeInsets.all(8),
            child: SampleTheme(
              title: 'tabBarTheme',
              theme: theme.tabBarTheme,
            ), // SampleTheme
          ), // Padding
          Padding(
            padding: EdgeInsets.all(8),
            child: SampleTheme(
              title: 'textButtonTheme',
              theme: theme.textButtonTheme,
            ), // SampleTheme
          ), // Padding
          Padding(
            padding: EdgeInsets.all(8),
            child: SampleTheme(
              title: 'textSelectionTheme',
              theme: theme.textSelectionTheme,
            ), // SampleTheme
          ), // Padding
          Padding(
            padding: EdgeInsets.all(8),
            child: SampleTheme(
              title: 'textTheme',
              theme: theme.textTheme,
            ), // SampleTheme
          ), // Padding
          Padding(
            padding: EdgeInsets.all(8),
            child: SampleTheme(
              title: 'timePickerTheme',
              theme: theme.timePickerTheme,
            ), // SampleTheme
          ), // Padding
          Padding(
            padding: EdgeInsets.all(8),
            child: SampleTheme(
              title: 'toggleButtonsTheme',
              theme: theme.toggleButtonsTheme,
            ), // SampleTheme
          ), // Padding
          Padding(
            padding: EdgeInsets.all(8),
            child: SampleTheme(
              title: 'tooltipTheme',
              theme: theme.tooltipTheme,
            ), // SampleTheme
          ), // Padding
          Padding(
            padding: EdgeInsets.all(8),
            child: SampleTheme(
              title: 'typography',
              theme: theme.typography,
            ), // SampleTheme
          ), // Padding
          Padding(
            padding: EdgeInsets.all(8),
            child: SampleColor(
              title: 'unselectedWidgetColor',
              background: theme.unselectedWidgetColor,
              foreground: invert(theme.unselectedWidgetColor),
            ), // SampleColor
          ), // Padding
          Padding(
            padding: EdgeInsets.all(8),
            child: SampleTheme(
              title: 'visualDensity',
              theme: theme.visualDensity,
            ), // SampleTheme
          ), // Padding
        ],
      ), // ListView
    );
  }

  Color invert(Color color) {
  final r = 255 - color.red;
  final g = 255 - color.green;
  final b = 255 - color.blue;

  //return Color.fromARGB((color.opacity * 255).round(), r, g, b);
  return Color.fromARGB(255, r, g, b);
  }

}



class SampleColor extends StatelessWidget {
  final String title;
  final Color background;
  final Color foreground;

  const SampleColor({
    required this.title,
    required this.background,
    required this.foreground,
  });

  @override
  Widget build(context) {
    final textTheme = Theme.of(context).textTheme;
    //final colorScheme = Theme.of(context).colorScheme;

    return Material(
      elevation: 2,
      borderRadius:
        BorderRadius.all(Radius.circular(20)),
      child: Container(
        width: Get.width,
        height: 100,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Text(
              title,
              style: textTheme.titleMedium!
                .copyWith(
                  color: foreground,
              ),
            ), // Text
            Text(
              '$background',
              style: textTheme.bodyMedium!
                .copyWith(
                  color: foreground,
              ),
            ), // Text
          ],
        ), // Column
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ), // BorderRadius
          color: background,
        ), // BoxDecoration
      ), // Container
    ); // Material
  }
}
