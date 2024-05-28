import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'html_controller.dart';
import '../routes/app_pages.dart';
//import '../tasklist/task/task_item.dart';

class HtmlView extends StatelessWidget {
  const HtmlView({
    super.key,
  });

  @override
  Widget build(context) {
    final HtmlController c = Get.find();

    return Scaffold(
      appBar: AppBar(
          title: Obx(() => Text("${c.task.value?.title}")),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.query_stats),
              color: Theme.of(context).colorScheme.primary,
              onPressed: () {
                Get.toNamed(Routes.DEBUG);
              },
            ),
          ]),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
        child: Column(
          children: [
            TextField(
              controller: c.resourceController,
              maxLines: 1,
              decoration: InputDecoration(
                icon: Icon(Icons.add_link),
              ), // InputDecoration
            ), // TextField
            SizedBox(height: 8), // SizedBox
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Column(
mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text(
                      'html tree',
                      style: Theme.of(context).textTheme.headlineLarge!,
                    ), // Text
                    IconButton.filledTonal(
                      style: const ButtonStyle(
    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
  ),
  constraints: BoxConstraints(
    maxWidth: Get.width  - 2  *  8,
    minWidth: Get.width  - 2  *  8,
    maxHeight: Get.width  - 2  *  8,
    minHeight:Get.width  - 2  *  8,
  ),
                      iconSize: Get.width  - 2  *  8,
                      icon: const Icon(Icons.blur_on),
                      onPressed: () {c.randomUrl();},
                    ), // IconButton
                  ], // children
                ), // Column
              ], // children
            ), // Row
          ], // children
        ), // Column
      ), // Padding
    );
  }
}
