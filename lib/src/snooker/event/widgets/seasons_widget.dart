import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SeasonsWidget extends StatelessWidget {
  const SeasonsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    //final textTheme = Theme.of(context).textTheme;
    //final colorScheme = Theme.of(context).colorScheme;

    return Container(
      width: Get.width,
      height: Get.height,
      margin: const EdgeInsets.all(8),
      child: ListView.builder(
        itemCount: 25,
        itemBuilder: (BuildContext context, int index) {
          return Text('${2000 + index} year in snooker'); // Text
        },
      ), // ListView
    ); // Container
  }
}
