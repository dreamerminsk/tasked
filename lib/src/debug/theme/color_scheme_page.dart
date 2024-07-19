import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tasked/main.dart';

import 'sample_color.dart';
import 'src/core/colors.dart';
import '../../core/widgets/icon_buttons.dart';
import '../../core/color_utils.dart';
import '../../routes/app_pages.dart';

class ColorSchemePage extends StatelessWidget {
  final isShowInfo = ValueNotifier<bool>(false);
  final seedColor = ValueNotifier<NamedMaterialColor>(MyApp.seedColor);
  final shadeColor = ValueNotifier<NamedColor>(MyApp.shadeColor);
  final variant = ValueNotifier<DynamicSchemeVariant>(MyApp.variant);
  final _seedIdx = ValueNotifier<int>(0);
  final _shadeIdx = ValueNotifier<int>(0);
  final _variantIdx = ValueNotifier<int>(0);

  ColorSchemePage({super.key}) {
    _seedIdx.value = NamedColors.primaries().indexOf(MyApp.seedColor);
    _shadeIdx.value = MyApp.seedColor.shades().indexOf(MyApp.shadeColor);
    _variantIdx.value = DynamicSchemeVariant.values().indexOf(MyApp.variant);

    _seedIdx.addListener(() {
      seedColor.value = NamedColors.primaries()[_seedIdx.value];
      shadeColor.value = seedColor.value.shades()[_shadeIdx.value];
    });

    _shadeIdx.addListener(() {
      shadeColor.value = seedColor.value.shades()[_shadeIdx.value];
    });

    _variantIdx.addListener(() {
      variant.value = DynamicSchemeVariant.values()[_variantIdx.value];
    });
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: Text('ColorScheme'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.info_outline_rounded),
            color: colorScheme.primary,
            onPressed: () {
              isShowInfo.value = !isShowInfo.value;
            },
          ),
          DebugIconButton(route: Routes.DEBUG),
        ],
      ),
      body: ListView(
        children: <Widget>[
          _buildInfoContainer(context),
          ..._buildColorSamples(context),
        ],
      ),
    );
  }

  Widget _buildInfoContainer(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return ValueListenableBuilder<bool>(
      valueListenable: isShowInfo,
      builder: (context, value, child) {
        return Container(
          width: Get.width,
          height: Get.width / 1.618 / 2,
          padding: EdgeInsets.all(16.0),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: colorScheme.primaryFixed,
            border: Border(
              top: BorderSide(color: colorScheme.primary, width: 1.0),
              bottom: BorderSide(color: colorScheme.primary, width: 1.0),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildChooser(
                  context, () => NamedColors.primaries(), seedColor, _seedIdx),
              _buildChooser(context, () => seedColor.value.shades(), shadeColor,
                  _shadeIdx),
              _buildChooser(context, () => DynamicSchemeVariant.values(),
                  variant, _variantIdx),
            ],
          ),
        );
      },
    );
  }

  Widget _buildChooser(BuildContext context, List<Object> Function() values,
      ValueNotifier<Object> valueNotifier, ValueNotifier<int> idxNotifier) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        _buildIconButton(
          icon: Icons.arrow_back_ios_rounded,
          onPressed: () {
            idxNotifier.value > 0
                ? idxNotifier.value--
                : idxNotifier.value = values().length - 1;
          },
          color: colorScheme.onPrimaryFixed,
        ),
        Expanded(
          child: Align(
            alignment: Alignment.center,
            child: ValueListenableBuilder<Object>(
              valueListenable: valueNotifier,
              builder: (context, value, child) {
                return Text(
                  _objectToString(value),
                  style: textTheme.titleLarge!
                      .copyWith(color: colorScheme.onPrimaryFixed),
                );
              },
            ),
          ),
        ),
        _buildIconButton(
          icon: Icons.arrow_forward_ios_rounded,
          onPressed: () {
            idxNotifier.value = (idxNotifier.value + 1) % values().length;
          },
          color: colorScheme.onPrimaryFixed,
        ),
      ],
    );
  }

  Widget _buildIconButton({
    required IconData icon,
    required VoidCallback onPressed,
    required Color color,
  }) {
    return IconButton(
      icon: Icon(icon),
      color: color,
      onPressed: onPressed,
    );
  }

  List<Widget> _buildColorSamples(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    final colorSamples = <Map<String, dynamic>>[
      {
        'title': 'primary',
        'background': colorScheme.primary,
        'foreground': colorScheme.onPrimary
      },
      {
        'title': 'primaryContainer',
        'background': colorScheme.primaryContainer,
        'foreground': colorScheme.onPrimaryContainer
      },
      {
        'title': 'primaryFixed',
        'background': colorScheme.primaryFixed,
        'foreground': colorScheme.onPrimaryFixed
      },
      {
        'title': 'primaryFixedDim',
        'background': colorScheme.primaryFixedDim,
        'foreground': colorScheme.onPrimaryFixedVariant
      },
      {
        'title': 'secondary',
        'background': colorScheme.secondary,
        'foreground': colorScheme.onSecondary
      },
      {
        'title': 'secondaryContainer',
        'background': colorScheme.secondaryContainer,
        'foreground': colorScheme.onSecondaryContainer
      },
      {
        'title': 'secondaryFixed',
        'background': colorScheme.secondaryFixed,
        'foreground': colorScheme.onSecondaryFixed
      },
      {
        'title': 'secondaryFixedDim',
        'background': colorScheme.secondaryFixedDim,
        'foreground': colorScheme.onSecondaryFixedVariant
      },
      {
        'title': 'tertiary',
        'background': colorScheme.tertiary,
        'foreground': colorScheme.onTertiary
      },
      {
        'title': 'tertiaryContainer',
        'background': colorScheme.tertiaryContainer,
        'foreground': colorScheme.onTertiaryContainer
      },
      {
        'title': 'tertiaryFixed',
        'background': colorScheme.tertiaryFixed,
        'foreground': colorScheme.onTertiaryFixed
      },
      {
        'title': 'tertiaryFixedDim',
        'background': colorScheme.tertiaryFixedDim,
        'foreground': colorScheme.onTertiaryFixedVariant
      },
      {
        'title': 'error',
        'background': colorScheme.error,
        'foreground': colorScheme.onError
      },
      {
        'title': 'errorContainer',
        'background': colorScheme.errorContainer,
        'foreground': colorScheme.onErrorContainer
      },
      {
        'title': 'surface',
        'background': colorScheme.surface,
        'foreground': colorScheme.onSurface
      },
      {
        'title': 'surfaceDim',
        'background': colorScheme.surfaceDim,
        'foreground': colorScheme.onSurface
      },
      {
        'title': 'surfaceBright',
        'background': colorScheme.surfaceBright,
        'foreground': colorScheme.onSurface
      },
      {
        'title': 'surfaceContainerLowest',
        'background': colorScheme.surfaceContainerLowest,
        'foreground': colorScheme.onSurface
      },
      {
        'title': 'surfaceContainerLow',
        'background': colorScheme.surfaceContainerLow,
        'foreground': colorScheme.onSurface
      },
      {
        'title': 'surfaceContainer',
        'background': colorScheme.surfaceContainer,
        'foreground': colorScheme.onSurface
      },
      {
        'title': 'surfaceContainerHigh',
        'background': colorScheme.surfaceContainerHigh,
        'foreground': colorScheme.onSurface
      },
      {
        'title': 'surfaceContainerHighest',
        'background': colorScheme.surfaceContainerHighest,
        'foreground': colorScheme.onSurface
      },
      {
        'title': 'outline',
        'background': colorScheme.outline,
        'foreground': ColorUtils.contrastThemeColor(colorScheme.outline)
      },
      {
        'title': 'outlineVariant',
        'background': colorScheme.outlineVariant,
        'foreground': ColorUtils.contrastThemeColor(colorScheme.outlineVariant)
      },
      {
        'title': 'inverseSurface',
        'background': colorScheme.inverseSurface,
        'foreground': colorScheme.onInverseSurface
      },
      {
        'title': 'inversePrimary',
        'background': colorScheme.inversePrimary,
        'foreground': colorScheme.primary
      },
      {
        'title': 'shadow',
        'background': colorScheme.shadow,
        'foreground': ColorUtils.contrastThemeColor(colorScheme.shadow)
      },
      {
        'title': 'scrim',
        'background': colorScheme.scrim,
        'foreground': ColorUtils.contrastThemeColor(colorScheme.scrim)
      },
      {
        'title': 'surfaceTint',
        'background': colorScheme.surfaceTint,
        'foreground': ColorUtils.contrastThemeColor(colorScheme.surfaceTint)
      },
    ];

    return colorSamples.map((sample) {
      return Padding(
        padding: EdgeInsets.all(8),
        child: SampleColor(
          title: sample['title'] as String,
          background: sample['background'] as Color,
          foreground: sample['foreground'] as Color,
        ),
      );
    }).toList();
  }

  String _objectToString(Object obj) {
    if (obj is NamedMaterialColor) {
      return obj.name;
    } else if (obj is NamedColor) {
      return obj.name;
    } else if (obj is DynamicSchemeVariant) {
      return obj.toString().split('.').last;
    }
    return obj.toString();
  }
}
