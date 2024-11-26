import 'package:flutter/material.dart';

class RightTitle extends StatelessWidget {
  final String title;

  const RightTitle({
    super.key,
    this.title,
  });

  @override
  Widget build(context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      height: 200,
      alignment: Alignment.center,
      child: RotatedBox(
        quarterTurns: 3,
        child: Text(
          this.title,
          style: textTheme.titleLarge!.copyWith(
            color: colorScheme.onPrimary,
          ),
        ), // Text
      ), // RotatedBox,
      padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 8.0),
      decoration: BoxDecoration(
        border: Border(
          left: BorderSide(
            color: colorScheme.onPrimary,
            width: 2,
          ), // BorderSide
        ), // Border
      ), // BoxDecoration
    ); // Container
  }
}
