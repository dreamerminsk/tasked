import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/color_utils.dart';

class SampleColorGreen extends StatelessWidget {
  final int green;

  const SampleColorGreen({
    Key? key,
    required this.green,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    final containerHeight = Get.width / 2 / 1.618;
    final containerColor = Color.fromARGB(255, 0, green, 0);

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
            _buildGreenTextBox(context, colorScheme),
            _buildAlphaTextBox(context, containerColor),
          ],
        ),
      ),
    );
  }

  Widget _buildGreenTextBox(BuildContext context, ColorScheme colorScheme) {
    return AspectRatio(
      aspectRatio: 1.0,
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.green,
        ),
        child: Text(
          'G',
          style: Theme.of(context)
              .textTheme
              .displayLarge!
              .copyWith(color: ColorUtils.contrastThemeColor(Colors.green)),
        ),
      ),
    );
  }

  Widget _buildAlphaTextBox(BuildContext context, Color containerColor) {
    return Container(
      alignment: Alignment.center,
      color: Colors.transparent,
      child: Text(
        '#${green.toRadixString(16).padLeft(2, '0').toUpperCase()}',
        style: Theme.of(context)
            .textTheme
            .headlineLarge!
            .copyWith(color: ColorUtils.contrastThemeColor(containerColor)),
      ),
    );
  }
}
