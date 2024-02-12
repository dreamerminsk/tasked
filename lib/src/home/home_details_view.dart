import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_indicator/loading_indicator.dart';

import 'home_controller.dart';
import 'home_chart.dart';

//https://en.wikipedia.org/api/rest_v1/page/summary/Minsk
//https://en.wikipedia.org/w/api.php?format=json&action=query&prop=extracts&exintro&explaintext&redirects=1&pageids=21721040
class HomeDetailsView extends StatelessWidget {
  final RxInt titleOpacity = RxInt(100);
  final RxInt toDir = RxInt(-5);

  final RxInt descOpacity = RxInt(90);
  final RxInt doDir = RxInt(-5);

  final RxInt boxFit = RxInt(2);

  @override
  Widget build(context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    final HomeController c = Get.find();

    return Scaffold(
        body: Obx(() => Stack(
              fit: StackFit.expand,
              children: <Widget>[
                CachedNetworkImage(
                  imageUrl: (c.summary.value?.originalImage.source ?? ''),
                  placeholder: (context, url) => Container(
                    width: Get.width,
                    height: Get.height,
                    alignment: Alignment.center,
                    child: LoadingIndicator(colors: [
                      colorScheme.primary,
                      colorScheme.secondary,
                      colorScheme.tertiary,
                      colorScheme.error
                    ], indicatorType: Indicator.ballGridPulse),
                  ), // Container
                  errorWidget: (context, url, error) => Container(
                    width: Get.width,
                    height: Get.height,
                    alignment: Alignment.center,
                    child: Icon(
                      Icons.error,
                      size: Get.width - 16,
                      color: colorScheme.error,
                    ),
                  ), // Container
                  imageBuilder: (context, image) => ObxValue(
                      (data) => Container(
                            width: Get.width,
                            //height: 512,
                            alignment: Alignment.topLeft,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: image,
                                fit: BoxFit.values[boxFit.value],
                              ),
                              //border: Border.all(
                              //width: 3, color: Colors.red,
                              //),
                              //borderRadius: BorderRadius.vertical(
                              //bottom: Radius.circular(40),
                              //),
                            ),
                          ),
                      boxFit),
                ), //CachedNetworkImage
                Positioned(
                  top: 32,
                  left: 32,
                  right: 32,
                  child: GestureDetector(
                    onTap: () {
                      titleOpacity.value += toDir.value;
                      if (titleOpacity.value == 0) {
                        toDir.value *= -1;
                      }
                      if (titleOpacity.value == 100) {
                        toDir.value *= -1;
                      }
                    },
                    onHorizontalDragEnd: (details) {
                      if (details.primaryVelocity != null) {
                        boxFit.value =
                            (boxFit.value + 1) % BoxFit.values.length;
                      }
                    },
                    child: ObxValue(
                      (data) => Container(
                        padding: EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          color: colorScheme.onPrimary
                              .withOpacity(data.value * 0.01),
                          borderRadius: BorderRadius.all(
                            Radius.circular(8),
                          ),
                          border: Border.all(
                            width: 2,
                            color: colorScheme.primary,
                          ),
                        ), // BoxDecoration
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            //Expanded(
                            //child: Text(
                            Text(
                              '${c.selected.value.title} - ${BoxFit.values[boxFit.value]}',
                              maxLines: 2,
                              overflow: TextOverflow.fade,
                              style: textTheme.headlineLarge!.copyWith(
                                color: colorScheme.primary,
                              ),
                            ), // Text
                            //), //Expanded
                          ],
                        ), // Row
                      ), // Container
                      titleOpacity,
                    ), // ObxValue
                  ), // GestureDetector
                ), // Positioned
                Positioned(
                  top: 2 * Get.height / 3,
                  left: 32,
                  right: 32,
                  child: GestureDetector(
                    onTap: () {
                      descOpacity.value += doDir.value;
                      if (descOpacity.value == 0) {
                        doDir.value *= -1;
                      }
                      if (descOpacity.value == 100) {
                        doDir.value *= -1;
                      }
                    },
                    child: ObxValue(
                      (data) => Container(
                        padding: EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          color: colorScheme.primary
                              .withOpacity(data.value * 0.01),
                          borderRadius: BorderRadius.all(
                            Radius.circular(8),
                          ),
                          border: Border.all(
                            width: 2,
                            color: colorScheme.onPrimary,
                          ),
                        ), // BoxDecoration
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            // Expanded(child:
                            Obx(() => Text(
                                  c.summary.value?.description ?? '',
                                  style: textTheme.headlineMedium!.copyWith(
                                    color: colorScheme.onPrimary,
                                  ),
                                )), // Text
                            // ), //Expanded
                          ],
                        ), // Row
                      ), // Container
                      descOpacity,
                    ), // ObxValue
                  ), // GestureDetector
                ), // Positioned
              ],
            )), //Stack
        floatingActionButton: FloatingActionButton(
            child: Icon(Icons.query_stats),
            onPressed: () => Get.to(HomeChart())));
  }
}
