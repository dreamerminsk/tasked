import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'category_controller.dart';

class CategoryView extends StatelessWidget {

  @override
  Widget build(context) {
    final CategoryController c = Get.find();

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
                    style: TextStyle(
                      fontSize: 24,
                      color: Theme.of(context).colorScheme.onPrimary,
            ), // TextStyle
                  )), // Text
                ],
              ), // Column
            ), // Container
            Positioned(
              top: 200,
              child: Container(
                child: ListView(),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
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
