import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'dom_controller.dart';
import '../../routes/app_pages.dart';
import '../../core/widgets/icon_buttons.dart';

class DomView extends StatelessWidget {
  const DomView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final DomController controller = Get.find();

    return Scaffold(
      appBar: AppBar(
        title: Obx(() => Text('${controller.task.value?.title ?? ""}')),
        actions: <Widget>[
          DebugIconButton(
            route: Routes.DEBUG,
          ),
        ],
      ),
      body: Obx(() {
        return ListView.builder(
          itemCount: 32,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.all(8),
              child: Card(
                child: ListTile(
                  title: Text('$index'),
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
