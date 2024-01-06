import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HealthWidget extends StatelessWidget {
  final String started;
  
  const HealthWidget({
    super.key,
    this.started = 'NOT IMPLEMENTED'
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      width: Get.width,
      height: 200,
      child: Column(
        crossAxisAlignment:
          CrossAxisAlignment.center,
        mainAxisAlignment:
          MainAxisAlignment.center,
        children: <Widget>[
          Text(
            started,
            style: textTheme.displaySmall!
              .copyWith(
                color: colorScheme.onSecondaryContainer
              ),
          ), // Text
        ],
      ), // Column
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(30),
        ), // BorderRadius
        color: colorScheme.secondaryContainer,
      ), // BoxDecoration
    ); //Container
  }
}
