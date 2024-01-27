import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_indicator/loading_indicator.dart';

import 'home_controller.dart';

//https://en.wikipedia.org/api/rest_v1/page/summary/Minsk
//https://en.wikipedia.org/w/api.php?format=json&action=query&prop=extracts&exintro&explaintext&redirects=1&pageids=21721040
class HomeDetailsView extends StatelessWidget {

  final titleOpacity = 60.obs;
  int toDir = -5;

  final descOpacity = 0.5.obs;
  double doDir = -0.05;

  @override
  Widget build(context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    final HomeController c = Get.find();

    return Scaffold(
      body: 
      Obx(()=>
        Stack(
          children: <Widget>[
            CachedNetworkImage(
              imageUrl: (c.selected.value.wiki?.image ?? '').replaceFirst('220px','512px'),
              placeholder: (context, url) => LoadingIndicator(indicatorType: Indicator.ballGridPulse),
              errorWidget: (context, url, error) => Icon(Icons.error, size: Get.width - 16, color: Colors.black,),
              imageBuilder: (context, image) => Container(
                      width: Get.width,
                      //height: 512,
                      alignment: Alignment.topLeft,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: image,
                          fit: BoxFit.cover,
                        ),
                        //border: Border.all(
                          //width: 3, color: Colors.red,
                        //),
                        //borderRadius: BorderRadius.vertical(
                          //bottom: Radius.circular(40),
                        //),
                      ),
              ),
                  ), //CachedNetworkImage
            Positioned(
              top: 32,
              left: 32,
              right: 32,
              child: GestureDetector(
                onTap: () {
                  titleOpacity.value += toDir;
                  if (titleOpacity.value == 0) { toDir *= -1; }
                  if (titleOpacity.value == 100) { toDir *= -1; }
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: ObxValue(
                      (data) => colorScheme.onPrimary.withOpacity(data.value * 0.01),
                      textOpacity
                    ), // ObxValue
                    borderRadius: BorderRadius.all(
                      Radius.circular(8),
                    ),
                    border: Border.all(
                      width: 1, color: colorScheme.primary,
                    ),
                  ), // BoxDecoration
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      //Expanded(
                        //child: Text(
                        Text(
                          c.selected.value.title ?? '<~~~~~>',
                          maxLines: 2,
                          overflow: TextOverflow.fade,
                          style: textTheme.headlineLarge!
                          .copyWith(color: colorScheme.primary,),
                        ), // Text
                      //), //Expanded
                    ],
                  ), // Row
                ), // Container
              ), // GestureDetector
            ), // Positioned
            Positioned(
              top: 2 * Get.height / 3,
              left: 32,
              right: 32,
              child: Container(
                decoration: BoxDecoration(
                  color: colorScheme.primary.withOpacity(0.50),
                  borderRadius: BorderRadius.all(
                    Radius.circular(8),
                  ),
                  border: Border.all(
                    width: 1, color: colorScheme.onPrimary,
                  ),
                ), // BoxDecoration
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      child: Text(
                        'very very very long article description',
                        style: textTheme.headlineMedium!
                        .copyWith(color: Theme.of(context).colorScheme.onPrimary,),
                      ), // Text
                    ), //Expanded
                  ],
                ), // Row
              ), // Container
            ), // Positioned
          ],
        )), //Stack
      floatingActionButton:
          FloatingActionButton(child: Icon(Icons.refresh), onPressed: c.refresh));
  }
}
