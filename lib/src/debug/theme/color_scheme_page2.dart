import 'package:flutter/material.dart';
import 'package:get/get.dart';
//import 'package:tasked/main.dart';

//import 'sample_color.dart';
//import '../../core/colors.dart';
import '../../core/widgets/icon_buttons.dart';
//import '../../core/color_utils.dart';
import '../../routes/app_pages.dart';
import 'color_scheme/seed_color_notifier.dart';
import 'color_scheme/seed_color_spinner.dart';

class ColorSchemePage2 extends StatelessWidget {
  ColorSchemePage2({super.key}) {}

  @override
  Widget build(BuildContext context) {
    //final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: Text('colorScheme 2.0'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.info_outline_rounded),
            color: colorScheme.primary,
            onPressed: () {},
          ),
          DebugIconButton(route: Routes.DEBUG),
        ],
      ),
      body: _buildInfoContainer(context),
    );
  }

  Widget _buildInfoContainer(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return AnimatedContainer(
      duration: const Duration(
        seconds: 1,
      ),
      width: Get.width,
      height: 3 * Get.width / 1.618 / 4,
      padding: EdgeInsets.all(16.0),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: colorScheme.surface,
        border: Border(
          top: BorderSide(color: colorScheme.primary, width: 2.0),
          bottom: BorderSide(color: colorScheme.primary, width: 2.0),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          ChangeNotifierProvider(
            create: (_) => new SeedColorNotifier(),
            child: SeedColorSpinner(),
          ),
        ],
      ),
    );
  }
}
