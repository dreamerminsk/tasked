import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'seed_color_notifier.dart';

//import '../../../core/color_utils.dart';

class SeedColorSpinner extends StatelessWidget {
  SeedColorSpinner({super.key}) {}

  @override
  Widget build(BuildContext context) {
    //final textTheme = Theme.of(context).textTheme;
    //final colorScheme = colorSchemeN.value;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Consumer<SeedColorNotifier>(
          builder: (context, value, child) => IconButton(
            iconSize: 28,
            icon: Icon(Icons.color_lens),
            color: value.prevColor.colorSwatch,
            onPressed: () {
              value.decColorIdx();
            },
          ),
        ), // Consumer
        Consumer<SeedColorNotifier>(
          builder: (context, value, child) => IconButton(
            iconSize: 32,
            icon: Icon(Icons.color_lens),
            color: value.prevShade.color,
            onPressed: () {
              value.decShadeIdx();
            },
          ),
        ), // Consumer

        Consumer<SeedColorNotifier>(
          builder: (context, value, child) => IconButton(
            iconSize: 36,
            icon: Icon(Icons.color_lens),
            color: value.shade.color,
            onPressed: () {},
          ),
        ), // Consumer

        Consumer<SeedColorNotifier>(
          builder: (context, value, child) => IconButton(
            iconSize: 32,
            icon: Icon(Icons.color_lens),
            color: value.nextShade.color,
            onPressed: () {
              value.incShadeIdx();
            },
          ),
        ), // Consumer
        Consumer<SeedColorNotifier>(
          builder: (context, value, child) => IconButton(
            iconSize: 28,
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
