import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/color_utils.dart';

class SampleColorBlue extends StatelessWidget {
  final int blue;

  const SampleColorBlue({
    Key? key,
    required this.blue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    final containerHeight = Get.width / 2 / 1.618; 
    final containerColor = Color.fromARGB(255, 0, 0, blue);

    return Material(
      elevation: 4,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        width: double.infinity,
        height: containerHeight,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: containerColor,
        ),
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildRedTextBox(context, colorScheme),
            _buildAlphaTextBox(context, containerColor),
          ],
        ),
      ),
    );
  }

  Widget _buildRedTextBox(BuildContext context, ColorScheme colorScheme) {
    return AspectRatio(
      aspectRatio: 1.0,
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: colorScheme.primary,
        ),
        child: Text(
          'B',
          style: Theme.of(context)
              .textTheme
              .displayLarge!
              .copyWith(color: colorScheme.onPrimary),
        ),
      ),
    );
  }

  Widget _buildAlphaTextBox(BuildContext context, Color containerColor) {
    return Container(
      alignment: Alignment.center,
      color: Colors.transparent,
      child: Text(
        '$blue',
        style: Theme.of(context)
            .textTheme
            .displayLarge!
            .copyWith(color: ColorUtils.contrastThemeColor(containerColor)),
      ),
    );
  }
}