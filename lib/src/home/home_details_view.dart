import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_indicator/loading_indicator.dart';

import 'home_controller.dart';

//https://en.wikipedia.org/api/rest_v1/page/summary/Minsk
//https://en.wikipedia.org/w/api.php?format=json&action=query&prop=extracts&exintro&explaintext&redirects=1&pageids=21721040
class HomeDetailsView extends StatelessWidget {

  @override
  Widget build(context) {
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
              child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.onPrimary.withOpacity(0.60),
                  borderRadius: BorderRadius.all(
                    Radius.circular(8),
                  ),
                  border: Border.all(
                          width: 1, color: Theme.of(context).colorScheme.primary,
                  ),
                ), // BoxDecoration
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    //Expanded(
                      //child: Text(
                      Text(
                        c.selected.value.title ?? '<~~~~~>',
                        maxLines: 2,
                        overflow: TextOverflow.fade,
                        style: Theme.of(context).textTheme.headlineLarge!
                        .copyWith(color: Theme.of(context).colorScheme.primary,),
                      ), // Text
                    //), //Expanded
                  ],
                ), // Row
              ), // Container
            ), // Positioned
            Positioned(
              top: 2 * Get.height / 3,
              left: 32,
              right: 32,
              child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary.withOpacity(0.50),
                  borderRadius: BorderRadius.all(
                    Radius.circular(8),
                  ),
                  border: Border.all(
                          width: 1, color: Theme.of(context).colorScheme.onPrimary,
                  ),
                ), // BoxDecoration
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      child: Text(
                        'very very very long article description',
                        style: Theme.of(context).textTheme.headlineMedium!
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
