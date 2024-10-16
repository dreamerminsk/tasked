import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'dir_list_view.dart';

class DirCard extends StatelessWidget {
  final int index;
  final String title;
  final Color? background;
  final Color? foreground;
  final Rxn<FileStat> stat = Rxn<FileStat>();

  DirCard({
    required this.index,
    required this.title,
    this.background,
    this.foreground,
  }) {
    _fetchFileStat();
  }

  void _fetchFileStat() {
    FileStat.stat(title).then((value) => stat.value = value);
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    final borderRadius = index.isEven
        ? BorderRadius.only(
            topRight: Radius.circular(20),
            bottomRight: Radius.circular(20),
          )
        : BorderRadius.only(
            topLeft: Radius.circular(20),
            bottomLeft: Radius.circular(20),
          );

    return InkWell(
      onTap: () {
        Get.to(() => DirListView(path: title), preventDuplicates: false);
      },
      child: Material(
        elevation: 4,
        borderRadius: borderRadius,
        child: Container(
          width: Get.width,
          height: 100,
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            borderRadius: borderRadius,
            color: background ?? colorScheme.primary,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: index.isEven
                ? CrossAxisAlignment.end
                : CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                title.split('/').last,
                style: textTheme.titleLarge!.copyWith(
                  color: foreground ?? colorScheme.onPrimary,
                ),
              ),
              ObxValue<Rxn<FileStat>>(
                (data) => Wrap(
                  spacing: 8.0,
                  children: <Widget>[
                    Text(
                      data.value == null
                          ? "01.01.2001"
                          : _format(data.value!.modified),
                      style: textTheme.bodyMedium!.copyWith(
                        color: foreground ?? colorScheme.onPrimary,
                      ),
                    ),
                    Text(
                      '${data.value?.size ?? 0}',
                      style: textTheme.bodyMedium!.copyWith(
                        color: foreground ?? colorScheme.onPrimary,
                      ),
                    ),
                  ],
                ),
                stat,
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _format(DateTime dt) {
    return DateFormat.yMd().add_Hms().format(dt);
  }
}
