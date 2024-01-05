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
              color:
                Theme.of(context).colorScheme.primary,
              child: Column(
                crossAxisAlignment:
                  CrossAxisAlignment.center,
                mainAxisAlignment:
                  MainAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: 20),
                  Obx(() => Text(
                    c.category.value?.title ?? '~~~',
                    style: textTheme.displaySmall!
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
                  children: List<Widget>.generate(
                    32, (int index) => Text('$index')
                  ),
                ), // ListView
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ), // BorderRadius
                  color: Theme.of(context).colorScheme.secondaryContainer,
                ), // BoxDecoration
              ), //Container
            ), // Positioned
          ],
        ), //Stack
      ),
    );
  }
}
