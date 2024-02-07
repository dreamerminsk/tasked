import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'dir_page.dart';

class SampleDir extends StatelessWidget {
  final int index;
  final String title;
  final Color background;
  final Color foreground;
  final Rxn<FileStat> stat = Rxn<FileStat>();

  SampleDir({
    required this.index,
    required this.title,
    required this.background,
    required this.foreground,
  });

  @override
  Widget build(context) {
    final textTheme = Theme.of(context).textTheme;
    //final colorScheme = Theme.of(context).colorScheme;
    final d = Directory(title);
    d.stat().then((value) => stat.value = value);

    return InkWell(
      onTap: () {
        Get.to(DirPage(path: title), preventDuplicates: false);
      },
      child: Material(
        elevation: 1,
        borderRadius: index.isEven
            ? BorderRadius.only(
                topRight: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ) // BorderRadius
            : BorderRadius.only(
                topLeft: Radius.circular(20),
                bottomLeft: Radius.circular(20),
              ), // BorderRadius
        child: Container(
          width: Get.width,
          height: 100,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text(
                title.split('/').last,
                style: textTheme.titleMedium!.copyWith(
                  color: foreground,
                ),
              ), // Text
              ObxValue(
                (data) => Text(
                  'size: ${data.value?.size ?? 0}, modified: ${data.value == null ? "~~.~~.~~~~" : _format(data.value!.modified)}',
                  style: textTheme.titleMedium!.copyWith(
                    color: foreground,
                  ),
                ), // Text
                stat,
              ), // ObxValue
            ],
          ), // Column
          decoration: BoxDecoration(
            borderRadius: index.isEven
                ? BorderRadius.only(
                    topRight: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ) // BorderRadius
                : BorderRadius.only(
                    topLeft: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                  ), // BorderRadius
            color: background,
          ), // BoxDecoration
        ), // Container
      ), // Material
    );
  }

  String _format(DateTime dt) {
    return DateFormat.yMMMMd().add_Hms().format(dt);
  }
}
