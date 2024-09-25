import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tasked/main.dart';

import 'sample_color.dart';
import '../../core/colors.dart';
import '../../core/widgets/icon_buttons.dart';
import '../../core/color_utils.dart';
import '../../routes/app_pages.dart';



class ColorSchemePage2 extends StatelessWidget {
  ColorSchemePage2({super.key}) {

  }

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
            onPressed: () {
              
            },
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
            color: colorScheme.secondaryFixed,
            border: Border(
              top: BorderSide(color: colorScheme.primary, width: 1.0),
              bottom: BorderSide(color: colorScheme.primary, width: 1.0),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[_buildChooser(context),],
          ),
       );
    }

Widget _buildChooser(BuildContext context) {
final textTheme = Theme.of(context).textTheme;
    final colorScheme = colorSchemeN.value;

    return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
    IconButton(
      icon: Icon(Icons.color_lens),
      color: Colors.yellow,
      onPressed: (){},
    ),
    IconButton(
      icon: Icon(Icons.color_lens),
      color: Colors.orange.shade300,
      onPressed: (){},
    ),

AnimatedContainer(
         duration: const Duration(
            seconds: 1,
          ),
         padding: EdgeInsets.all(8.0),
          alignment: Alignment.center,
                       decoration: BoxDecoration(
                color: Colors.orange,
                          borderRadius: BorderRadius.circular(10),
              ),
              child: Text('orange'),
),


IconButton(
      icon: Icon(Icons.color_lens),
      color: Colors.orange.shade700,
      onPressed: (){},
    ),
IconButton(
      icon: Icon(Icons.color_lens),
      color: Colors.brown,
      onPressed: (){},
    ),
],
    );
}

}