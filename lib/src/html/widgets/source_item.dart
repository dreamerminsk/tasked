import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SourceItem extends StatelessWidget {
  const SourceItem({
    Key? key,
    required this.location,
  }) : super(key: key);

  final String location;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    final uri = Uri.tryParse(location);

    return InkWell(
      onTap: () {
        // Add your onTap functionality here
      },
      borderRadius: BorderRadius.circular(20),
      child: AspectRatio(
        aspectRatio: 2 * 1.618,
        child: Container(
          width: Get.width - 16.0,
          decoration: BoxDecoration(
            color: colorScheme.primaryFixed,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: colorScheme.primary, width: 2.0),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(4.0),
                decoration: BoxDecoration(
                  color: colorScheme.primaryFixed,
                  borderRadius:
                      const BorderRadius.vertical(top: Radius.circular(20)),
                  border: Border(
                    bottom: BorderSide(
                        color: colorScheme.onPrimaryFixed, width: 2.0),
                  ),
                ),
                child: Text(
                  uri?.host == null ? 'LocalSource' : 'WebSource',
                  style: textTheme.titleLarge
                      ?.copyWith(color: colorScheme.onPrimaryFixed),
                  textAlign: TextAlign.center,
                ),
              ),
              Expanded(
                child: Center(
                  child: Text(
                    uri?.host ?? location.split("/").last,
                    style: textTheme.headlineLarge?.copyWith(
                      color: colorScheme.onPrimaryFixed,
                      fontWeight: FontWeight.w300,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
