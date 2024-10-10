import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'seed_color_notifier.dart';

import '../../../core/color_utils.dart';

class SeedColorSpinner extends StatelessWidget {
  SeedColorSpinner({super.key}) {}

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    //final colorScheme = colorSchemeN.value;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Consumer<SeedColorNotifier>(
          builder: (context, value, child) => IconButton(
            icon: Icon(Icons.color_lens),
            color: value.prevColor.colorSwatch,
            onPressed: () {
              value.decColorIdx();
            },
          ),
        ), // Consumer
        Consumer<SeedColorNotifier>(
          builder: (context, value, child) => IconButton(
            icon: Icon(Icons.color_lens),
            color: value.prevShade.color,
            onPressed: () {
              value.decShadeIdx();
            },
          ),
        ), // Consumer
        Consumer<SeedColorNotifier>(
          builder: (context, value, child) => AnimatedContainer(
            duration: const Duration(
              milliseconds: 500,
            ),
            padding: EdgeInsets.all(8.0),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: value.shade.color,
              borderRadius: BorderRadius.circular(20),
            ),
            child: AnimatedDefaultTextStyle(
              child: Text(
                '${value.shade.name}'
              ),
              style: textTheme.bodyLarge!.copyWith(
                  color: ColorUtils.contrastThemeColor(value.shade.color),
                ),
              duration: Duration(
                milliseconds: 500,
              ),
            ),
          ),
        ), // Consumer
        Consumer<SeedColorNotifier>(
          builder: (context, value, child) => IconButton(
            icon: Icon(Icons.color_lens),
            color: value.nextShade.color,
            onPressed: () {
              value.incShadeIdx();
            },
          ),
        ), // Consumer
        Consumer<SeedColorNotifier>(
          builder: (context, value, child) => IconButton(
            icon: Icon(Icons.color_lens),
            color: value.nextColor.colorSwatch,
            onPressed: () {
              value.incColorIdx();
            },
          ),
        ), // Consumer
      ],
    );
  }
}
