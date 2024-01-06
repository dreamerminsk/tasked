import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'category_controller.dart';

class CategoryView extends StatelessWidget {

  @override
  Widget build(context) {
    final CategoryController c = Get.find();
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Container(
              height: double.infinity,
              width: double.infinity,
              padding: const EdgeInsets.all(8),
              color:
                colorScheme.primary,
              child: Column(
                crossAxisAlignment:
                  CrossAxisAlignment.center,
                mainAxisAlignment:
                  MainAxisAlignment.start,
                children: <Widget>[
                  //SizedBox(height: 20),
                  Obx(() => Text(
                    c.category.value?.title ?? '~~~',
                    style: textTheme.headlineSmall!
                      .copyWith(
                        color: colorScheme.onPrimary
                      ),
                  )), // Text
                ],
              ), // Column
            ), // Container
            Positioned(
              top: 200,
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                child: ListView(
                  padding: const EdgeInsets.all(8),
                  children: List<Widget>.generate(
                    32, (int index) => Text('$index',
                      style: textTheme.bodyLarge!
                      .copyWith(
                        color: colorScheme.onSecondaryContainer
                      ),
                    )
                  ),
                ), // ListView
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ), // BorderRadius
                  color: colorScheme.secondaryContainer,
                ), // BoxDecoration
              ), //Container
            ), // Positioned
          ],
        ), //Stack
      ),
    );
  }
}
