import 'package:flutter/material.dart';
import 'package:get/get.dart';

//import 'dir_page.dart';

class ParentDir extends StatelessWidget {
  final String title;

  const ParentDir({
    super.key,
    required this.title,
  });

  @override
  Widget build(context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return InkWell(
      onTap: () {
        Get.back();
        //Get.to(DirPage(path: title), preventDuplicates: false);
      },
      child: Material(
        elevation: 1,
        borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ), // BorderRadius
        child: Container(
          width: Get.width,
          height: 100,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    title.split('/').last,
                    style: textTheme.titleLarge!
                      .copyWith(
                        color: colorScheme.onPrimary,
                    ),
                  ), // Text
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
