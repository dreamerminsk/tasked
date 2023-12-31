import 'package:flutter/material.dart';
//import 'package:get/get.dart';

//import 'category_controller.dart';

class CategoryView extends StatelessWidget {

  @override
  Widget build(context) {
    //final CategoryController c = Get.find();

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
                  Text('Category:*'),
                ],
              ), // Column
            ), // Container
          ],
        ), //Stack
      ),
    );
  }
}
