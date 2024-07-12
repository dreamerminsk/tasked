import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'sample_object.dart';
import 'sample_font_weight.dart';

class TextStylePage extends StatelessWidget {
  final ValueNotifier<TextStyle> textStyleNotifier;

  TextStylePage({
    super.key,
    required TextStyle textStyle,
  }) : textStyleNotifier = ValueNotifier<TextStyle>(textStyle);

  @override
  Widget build(context) {
    //final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    final safeAreaPadding = MediaQuery.of(context).padding;

    return Scaffold(
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(8, safeAreaPadding.top, 8, 0),
            child: _buildSampleText(context),
          ), // Padding
          Divider(
            color: colorScheme.primary,
            thickness: 1.5,
          ), // Divider
          Expanded(
            child: MediaQuery.removePadding(
              context: context,
              removeTop: true,
              child: ListView(
                //padding: EdgeInsets.all(8),
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(8),
                    child: SampleObject(
                      title: 'background',
                      object: textStyleNotifier.value.background,
                    ), // SampleObject
                  ), // Padding
                  Padding(
                    padding: EdgeInsets.all(8),
                    child: SampleObject(
                      title: 'backgroundColor',
                      object: textStyleNotifier.value.backgroundColor,
                    ), // SampleObject
                  ), // Padding
                  Padding(
                    padding: EdgeInsets.all(8),
                    child: SampleObject(
                      title: 'color',
                      object: textStyleNotifier.value.color,
                    ), // SampleObject
                  ), // Padding
                  Padding(
                    padding: EdgeInsets.all(8),
                    child: SampleObject(
                      title: 'decoration',
                      object: textStyleNotifier.value.decoration,
                    ), // SampleObject
                  ), // Padding
                  Padding(
                    padding: EdgeInsets.all(8),
                    child: SampleObject(
                      title: 'decorationColor',
                      object: textStyleNotifier.value.decorationColor,
                    ), // SampleObject
                  ), // Padding
                  Padding(
                    padding: EdgeInsets.all(8),
                    child: SampleObject(
                      title: 'decorationStyle',
                      object: textStyleNotifier.value.decorationStyle,
                    ), // SampleObject
                  ), // Padding
                  Padding(
                    padding: EdgeInsets.all(8),
                    child: SampleObject(
                      title: 'decorationThickness',
                      object: textStyleNotifier.value.decorationThickness,
                    ), // SampleObject
                  ), // Padding
                  Padding(
                    padding: EdgeInsets.all(8),
                    child: SampleObject(
                      title: 'fontFamily',
                      object: textStyleNotifier.value.fontFamily,
                    ), // SampleObject
                  ), // Padding
                  Padding(
                    padding: EdgeInsets.all(8),
                    child: SampleObject(
                      title: 'fontSize',
                      object: textStyleNotifier.value.fontSize,
                    ), // SampleObject
                  ), // Padding
                  Padding(
                    padding: EdgeInsets.all(8),
                    child: SampleObject(
                      title: 'fontStyle',
                      object: textStyleNotifier.value.fontStyle,
                    ), // SampleObject
                  ), // Padding
                  Padding(
                    padding: EdgeInsets.all(8),
                    child: SampleFontWeight(
                      textStyleNotifier: textStyleNotifier,
                    ), // SampleFontWeight
                  ), // Padding
                  Padding(
                    padding: EdgeInsets.all(8),
                    child: SampleObject(
                      title: 'foreground',
                      object: textStyleNotifier.value.foreground,
                    ), // SampleObject
                  ), // Padding
                  Padding(
                    padding: EdgeInsets.all(8),
                    child: SampleObject(
                      title: 'height',
                      object: textStyleNotifier.value.height,
                    ), // SampleObject
                  ), // Padding
                  Padding(
                    padding: EdgeInsets.all(8),
                    child: SampleObject(
                      title: 'leadingDistribution',
                      object: textStyleNotifier.value.leadingDistribution,
                    ), // SampleObject
                  ), // Padding
                  Padding(
                    padding: EdgeInsets.all(8),
                    child: SampleObject(
                      title: 'letterSpacing',
                      object: textStyleNotifier.value.letterSpacing,
                    ), // SampleObject
                  ), // Padding
                  Padding(
                    padding: EdgeInsets.all(8),
                    child: SampleObject(
                      title: 'locale',
                      object: textStyleNotifier.value.locale,
                    ), // SampleObject
                  ), // Padding
                  Padding(
                    padding: EdgeInsets.all(8),
                    child: SampleObject(
                      title: 'overflow',
                      object: textStyleNotifier.value.overflow,
                    ), // SampleObject
                  ), // Padding
                  Padding(
                    padding: EdgeInsets.all(8),
                    child: SampleObject(
                      title: 'shadows',
                      object: textStyleNotifier.value.shadows,
                    ), // SampleObject
                  ), // Padding
                  Padding(
                    padding: EdgeInsets.all(8),
                    child: SampleObject(
                      title: 'textBaseline',
                      object: textStyleNotifier.value.textBaseline,
                    ), // SampleObject
                  ), // Padding
                  Padding(
                    padding: EdgeInsets.all(8),
                    child: SampleObject(
                      title: 'wordSpacing',
                      object: textStyleNotifier.value.wordSpacing,
                    ), // SampleObject
                  ), // Padding
                ],
              ), // ListView
              // Removing top padding to align content with design specifications
            ), // MediaQuery.removePadding
          ), // Expanded
        ],
      ), // Column
    );
  }

  Widget _buildSampleText(BuildContext context) {
    //final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return ValueListenableBuilder<TextStyle>(
      valueListenable: textStyleNotifier,
      builder: (context, value, child) {
        return Material(
          elevation: 4,
          borderRadius: BorderRadius.all(Radius.circular(20)),
          child: Container(
            width: Get.width,
            height: Get.width / 1.618,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Carolina\r\nChureyno',
                  style: textStyleNotifier.value.copyWith(
                    color: colorScheme.onSurface,
                  ),
                ), // Text,
              ],
            ), // Column
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(20),
              ), // BorderRadius
              color: colorScheme.surface,
            ), // BoxDecoration
          ), // Container
        ); // Material
      },
    );
  }
}
