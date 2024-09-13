import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'color_page.dart';

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
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Material(
      elevation: 4,
      borderRadius: BorderRadius.all(Radius.circular(20)),
      child: InkWell(
        onTap: () => Get.to(ColorPage(color: background)),
        borderRadius: BorderRadius.all(Radius.circular(20)),
        child: AnimatedContainer(
          duration: const Duration(
            milliseconds: 500,
          ),
          width: double.infinity,
          height: 160,
          decoration: BoxDecoration(
            color: background,
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Divider(
                    color: foreground,
                    thickness: 1.5,
                  ),
                  SizedBox(height: 4),
                  Text(
                    title,
                    style: textTheme.titleLarge!.copyWith(
                      color: foreground,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
