import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'season_controller.dart';
import '../../routes/app_pages.dart';
import '../../core/widgets/icon_buttons.dart';

class SeasonView extends StatelessWidget {
  const SeasonView({
    super.key,
  });

  final double paddingValue = 8.0;

  @override
  Widget build(context) {
    final SeasonController c = Get.find();

    final double adjustedWidth = Get.width - 2 * 8;

    return Scaffold(
      appBar: AppBar(
          title: Obx(() => Text("${c.task.value?.title}")),
          actions: <Widget>[
            DebugIconButton(
              route: Routes.DEBUG,
            ), // DebugIconButton
          ]),
      body: Center(
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
          onPressed: () {},
        ), // IconButton
      ), // Center
    );
  }
}
