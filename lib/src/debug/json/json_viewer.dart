import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'json_controller.dart';

class JsonViewer extends StatelessWidget {
  const JsonViewer({
    super.key,
  });

  @override
  Widget build(context) {
    final JsonController c = Get.find();
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: Obx(() => Text(c.source.value.split('/').last)),
      ),
      body: Container(
        margin: EdgeInsets.all(8.0),
        width: Get.width,
        height: 200,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Text(
                  'pos: 0',
                  style: textTheme.bodyLarge!.copyWith(
                    color: colorScheme.onPrimary,
                  ),
                ), // Text
                Obx(() => Text(
                      'length: ${c.content.value.length}',
                      style: textTheme.bodyLarge!.copyWith(
                        color: colorScheme.onPrimary,
                      ),
                    )), // Text
              ],
            ), // Column
            RightTitle(
              title: 'JsonDocument',
            ), // RightTitle
          ],
        ), // Row
        padding: const EdgeInsets.fromLTRB(16.0, 8.0, 0.0, 8.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ), // BorderRadius
          color: colorScheme.primary,
        ), // BoxDecoration
      ), //Container
    );
  }
}

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

class ErrorWidget extends StatelessWidget {
  final Object error;

  const ErrorWidget({
    Key? key,
    required this.error,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Card(
        color: Colors.redAccent,
        elevation: 4.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ), // RoundedRectangleBorder
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.error,
                color: Colors.white,
                size: 48.0,
              ),
              const SizedBox(height: 16.0),
              Text(
                error.runtimeType.toString(),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16.0),
              Text(
                error.toString(),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ), // Column
        ), // Padding
      ), // Card
    ); // Padding
  }
}
