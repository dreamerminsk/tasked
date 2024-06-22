import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RequestedPath extends StatelessWidget {
  RequestedPath({
    super.key,
    required this._name,
    required this._request,
  });

  final String _name;
  final Future<Directory?> _request;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return FutureBuilder(
      future: _request,
      builder: (ctx, snapshot) {
        color = colorScheme.surfaceVariant;
        onColor = colorScheme.onSurfaceVariant;
        Directory? data;
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) {
            color = colorScheme.error;
            onColor = colorScheme.onError;
          } else if (snapshot.hasData) {
            data = snapshot.data as Directory?;
            if (data == null) {
              color = colorScheme.primaryContainer;
              onColor = colorScheme.onPrimaryContainer;
            } else {
              color = colorScheme.primary;
              onColor = colorScheme.onPrimary;
            }
          }
        }

        return AnimatedContainer(
          width: Get.width - 2 * 8.0,
          height: (Get.width - 2 * 8.0) / 1.618 / 2.0,
          duration: Duration(seconds: 4.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                '$_name',
                style: textTheme.headlineSmall!.copyWith(color: onColor),
              ), // Text
            ],
          ), // Column
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(
              Radius.circular(20),
            ), // BorderRadius
            color: color,
          ), // BoxDecoration
        ); //Container
      },
    );
  }
}
