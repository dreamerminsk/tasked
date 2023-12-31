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
            ),
            Positioned(
              top: 0.0,
              left: 20.0,
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Text(
                      'Category:*',
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                  ), //Expanded
                ],
              ), //Row
            ), //Positioned
          ],
        ), //Stack
      ),
    );
  }
}
