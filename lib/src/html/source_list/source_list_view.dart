import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'source_list_controller.dart';
import 'widgets/source_item.dart';
import '../../routes/app_pages.dart';
import '../../core/widgets/icon_buttons.dart';

class SourceListView extends StatelessWidget {
  const SourceListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final SourceListController controller = Get.find();

    return Scaffold(
      appBar: AppBar(
        title: Obx(() => Text(
            '${controller.task.value?.title ?? ''} > ${controller.currentUrl.value}')),
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
            final source = controller.defaultUrls[index];

            return Padding(
              padding: const EdgeInsets.all(8),
              child: SourceItem(
                location: source,
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
