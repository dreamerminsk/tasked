import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../routes/app_pages.dart';

class DirTitle extends StatelessWidget {
  final String title;
  final VoidCallback? onTap;

  const DirTitle({
    super.key,
    required this.title,
    this.onTap,
  });

  @override
  Widget build(context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return InkWell(
      onTap: () {
        //Get.back();
        //Get.to(DirPage(path: title), preventDuplicates: false);
      },
      child: Material(
        elevation: 4,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ), // BorderRadius
        child: Container(
          width: Get.width,
          height: 120,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  IconButton(
                    //iconSize: 72,
                    color: colorScheme.onPrimary,
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () {
                      Get.back();
                    },
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () => this.onTap?.call(),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          title.split('/').last,
                          overflow: TextOverflow.fade,
                          style: textTheme.titleLarge!.copyWith(
                            color: colorScheme.onPrimary,
                          ),
                        ), // Text
                      ), // Align
                    ), // GestureDetector
                  ), // Expanded
                  IconButton(
                    //iconSize: 72,
                    color: colorScheme.onPrimary,
                    icon: const Icon(Icons.query_stats),
                    onPressed: () {
                      Get.toNamed(Routes.DEBUG);
                    },
                  ),
                ],
              ), // Row
            ],
          ), // Column
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ), // BorderRadius
            color: colorScheme.primary,
          ), // BoxDecoration
        ), // Container
      ), // Material
    );
  }
}
