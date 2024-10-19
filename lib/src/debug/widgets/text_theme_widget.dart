import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/text_theme.dart';
import '../../routes/app_pages.dart';

class TextThemeWidget extends StatelessWidget {

List<NamedTextStyle> _styles;

 late  final ValueNotifier<int> primaryTextStyle;

  TextThemeWidget({
    super.key,
  }) {
     primaryTextStyle = ValueNotifier<int>(4);
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    _styles = NamedTextTheme.of(context).values;

    return Material(
      elevation: 1,
      borderRadius: BorderRadius.all(Radius.circular(20)),
      child: InkWell(
        onTap: () {
          Get.toNamed(Routes.TEXTTHEME);
        },
        child: Container(
          width: Get.width,
          height: 100,
          child: ValueListenableBuilder(
            valueListenable: primaryTextStyle,
            builder: (context, value, child) => 
              Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'textTheme',
                style: _styles[value].copyWith(
                    fontWeight: FontWeight.w300, color: colorScheme.onPrimary),
              ), // Text
                            Text(
                '${_styles[value].name}',
                style: textTheme.bodyLarge!.copyWith(
                    color: colorScheme.onPrimary,
),
              ), // Text
            ],
          ), // Column
          ), // ValueListenableBuilder
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ), // BorderRadius
            color: colorScheme.primary,
          ), // BoxDecoration
        ), //Container
      ),
    ); // Material
  }
}
