import 'package:flutter/material.dart';
import 'package:get/get.dart';

//import '../debug_controller.dart';

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
            child: SampleTheme(
              title: 'appBarTheme',
              theme: theme.appBarTheme,
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
            child: SampleColor(
              title: 'dialogBackgroundColor',
              background: theme.dialogBackgroundColor,
              foreground: invert(theme.dialogBackgroundColor),
            ), // SampleColor
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
            child: SampleColor(
              title: 'indicatorColor',
              background: theme.indicatorColor,
              foreground: invert(theme.indicatorColor),
            ), // SampleColor
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
            child: SampleColor(
              title: 'scaffoldBackgroundColor',
              background: theme.scaffoldBackgroundColor,
              foreground: invert(theme.scaffoldBackgroundColor),
            ), // SampleColor
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
            child: SampleColor(
              title: 'shadowColor',
              background: theme.shadowColor,
              foreground: invert(theme.shadowColor),
            ), // SampleColor
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
            child: SampleColor(
              title: 'unselectedWidgetColor',
              background: theme.unselectedWidgetColor,
              foreground: invert(theme.unselectedWidgetColor),
            ), // SampleColor
          ), // Padding
        ],
      ), // ListView
    );
  }

  Color invert(Color color) {
  final r = 255 - color.red;
  final g = 255 - color.green;
  final b = 255 - color.blue;

  return Color.fromARGB((color.opacity * 255).round(), r, g, b);
  }

}


class SampleTheme extends StatelessWidget {
  final String title;
  final Object? theme;
  
  const SampleTheme({
    super.key,
    required this.title,
    required this.theme,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Material(
      elevation: 2,
      borderRadius: BorderRadius.all(Radius.circular(20)),
      child: InkWell(
        onTap: () {
          //Get.toNamed(Routes.THEME); 
        },
        child: Container(
          width: Get.width,
          height: 100,
          child: Column(
            mainAxisAlignment:
              MainAxisAlignment.center,
            children: <Widget>[
              Text(
                title,
                style: textTheme.headlineSmall!
                  .copyWith(
                    color:
                      theme == null ?  colorScheme.onSurfaceVariant : colorScheme.onPrimary,
                  ),
              ), // Text
            ],
          ), // Column
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ), // BorderRadius
            color: theme == null ?  colorScheme.surfaceVariant : colorScheme.primary,
          ), // BoxDecoration
        ), //Container
      ), // InkWell
    ); // Material
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
