import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'html_controller.dart';
import 'widgets/source_item.dart';
import '../routes/app_pages.dart';
import '../core/widgets/icon_buttons.dart';

class HtmlView extends StatelessWidget {
  const HtmlView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final HtmlController controller = Get.find();

    return Scaffold(
      appBar: AppBar(
        title: Obx(() => Text(controller.task.value?.title ?? '')),
        actions: <Widget>[
          DebugIconButton(
            route: Routes.DEBUG,
          ),
        ],
      ),
      body: Obx(() {
        if (controller.defaultUrls.isEmpty) {
          return Center(child: Text('No sources available'));
        }
        return ListView.builder(
          itemCount: controller.defaultUrls.length,
          itemBuilder: (BuildContext context, int index) {
            final String url = controller.defaultUrls[index];
            final int length = url == controller.currentUrl
                ? controller.currentDoc.value.length
                : -1;

            return Padding(
              padding: const EdgeInsets.all(8),
              child: SourceItem(
                location: url,
                length: length,
                onTap: () {
                  controller.load(index);
                },
              ),
            );
          },
        );
      }),
    );
  }
}