import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'html_controller.dart';
import 'widgets/document_card.dart';
import '../routes/app_pages.dart';
import '../core/widgets/icon_buttons.dart';

class HtmlView extends StatelessWidget {
  const HtmlView({
    super.key,
  });

  @override
  Widget build(context) {
    final HtmlController c = Get.find();

    final double adjustedWidth = Get.width - 2 * 8;

    return Scaffold(
      appBar: AppBar(
          title: Obx(() => Text("${c.task.value?.title}")),
          actions: <Widget>[
            DebugIconButton(
              route: Routes.DEBUG,
            ), // DebugIconButton
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
            SizedBox(height: 16), // SizedBox
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    DocumentCard(),
                    SizedBox(height: 16), // SizedBox
                    Expanded(
                       child: Align(
    alignment: Alignment.center,
    child: IconButton.outlined(
                      style: const ButtonStyle(
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                      constraints: BoxConstraints(
                        maxWidth: adjustedWidth,
                        minWidth: adjustedWidth,
                        maxHeight: adjustedWidth,
                        minHeight: adjustedWidth,
                      ),
                      iconSize: adjustedWidth,
                      icon: const Icon(Icons.blur_on),
                      onPressed: () {
                        c.randomUrl();
                      },
                    ), // IconButton.outlined
                     ), // Align
                    ), // Expanded
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
