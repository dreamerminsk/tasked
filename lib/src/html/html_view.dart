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

    return Scaffold(
      appBar: AppBar(
          title: Obx(() => Text("${c.task.value?.title}")),
          actions: <Widget>[
            DebugIconButton(
              route: Routes.DEBUG,
            ), // DebugIconButton
          ]),
      body: ListView.builder(
                itemCount: c.defaultUrls.length,
                itemBuilder: (BuildContext context, int index) {
return Padding(
    padding:EdgeInsets.all(8),
    child:DocumentCard(location: c.defaultUrls[index]), // DocumentCard
); // Padding
                },
              ) // ListView.builder
    );
  }
}
