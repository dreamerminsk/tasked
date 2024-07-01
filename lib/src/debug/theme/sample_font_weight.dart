import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SampleFontWeight extends StatelessWidget {
  static const className = 'fontWeight';
  final FontWeight? fontWeight;
late final ValueNotifier<FontWeight?> value;

  const SampleFontWeight({
    super.key,
    required this.fontWeight,
  }) : value=ValueNotifier<FontWeight?>(fontWeight);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Material(
      elevation: 4,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        width: double.infinity,
        height: Get.width / 2 / 1.618, // Golden ratio height
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: colorScheme.primary,
        ),
        padding: const EdgeInsets.all(16),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: Align(
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    IconButton(
                      //iconSize: 72,
                      color: colorScheme.onPrimary,
                      icon: const Icon(Icons.arrow_back_ios_rounded),
                      onPressed: () {
final index = FontWeight.values.indexOf(value.value ?? FontWeight.w100);
if (index > 0) { value.value = FontWeight.values[index-1]; } else { value.value = FontWeight.values[FontWeight.values.length-1];}
},
                    ),
                    Expanded(
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          _objectToString(object),
                          style: textTheme.titleLarge!.copyWith(
                            fontWeight: FontWeight.w700,
                            color: colorScheme.onPrimary,
                          ),
                        ),
                      ), // Align
                    ), // Expanded
                    IconButton(
                      //iconSize: 72,
                      color: colorScheme.onPrimary,
                      icon: const Icon(Icons.arrow_forward_ios_rounded),
                      onPressed: () {
final index = FontWeight.values.indexOf(value.value ?? FontWeight.w100);
value.value = FontWeight.values[(index+1)%FontWeight.values.length];
},
                    ),
                  ],
                ), // Row
              ),
            ),
            const SizedBox(height: 0),
            Divider(
              color: colorScheme.onPrimary,
              thickness: 1.5,
            ),
            const SizedBox(height: 0),
            Text(
              className,
              style: textTheme.titleLarge!.copyWith(
                fontSize: textTheme.titleLarge!.fontSize! - 1,
                color: colorScheme.onPrimary,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  String _objectToString(FontWeight? object) {
    if (object == null) {
      return "null";
    }
    return object.toString().split('.').last;
  }
}
