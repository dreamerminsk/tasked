import 'package:flutter/material.dart';

import 'color_utils.dart';
import 'properties.dart';

class NamedColorScheme {
  const NamedColorScheme({required this.colorScheme});

  final ColorScheme colorScheme;

  factory NamedColorScheme.of(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return NamedColorScheme(colorScheme: colorScheme);
  }

  ColorProperty get primary => ColorProperty('primary', colorScheme.primary);
  ColorProperty get onPrimary =>
      ColorProperty('onPrimary', colorScheme.onPrimary);

  ColorProperty get primaryContainer =>
      ColorProperty('primaryContainer', colorScheme.primaryContainer);
  ColorProperty get onPrimaryContainer =>
      ColorProperty('onPrimaryContainer', colorScheme.onPrimaryContainer);

  ColorProperty get primaryFixed =>
      ColorProperty('primaryFixed', colorScheme.primaryFixed);
  ColorProperty get primaryFixedDim =>
      ColorProperty('primaryFixedDim', colorScheme.primaryFixedDim);
  ColorProperty get onPrimaryFixed =>
      ColorProperty('onPrimaryFixed', colorScheme.onPrimaryFixed);
  ColorProperty get onPrimaryFixedVariant =>
      ColorProperty('onPrimaryFixedVariant', colorScheme.onPrimaryFixedVariant);

  ColorProperty get secondary =>
      ColorProperty('secondary', colorScheme.secondary);
  ColorProperty get onSecondary =>
      ColorProperty('onSecondary', colorScheme.onSecondary);

  ColorProperty get secondaryContainer =>
      ColorProperty('secondaryContainer', colorScheme.secondaryContainer);
  ColorProperty get onSecondaryContainer =>
      ColorProperty('onSecondaryContainer', colorScheme.onSecondaryContainer);

  ColorProperty get secondaryFixed =>
      ColorProperty('secondaryFixed', colorScheme.secondaryFixed);
  ColorProperty get secondaryFixedDim =>
      ColorProperty('secondaryFixedDim', colorScheme.secondaryFixedDim);
  ColorProperty get onSecondaryFixed =>
      ColorProperty('onSecondaryFixed', colorScheme.onSecondaryFixed);
  ColorProperty get onSecondaryFixedVariant => ColorProperty(
      'onSecondaryFixedVariant', colorScheme.onSecondaryFixedVariant);

  ColorProperty get tertiary => ColorProperty('tertiary', colorScheme.tertiary);
  ColorProperty get onTertiary =>
      ColorProperty('onTertiary', colorScheme.onTertiary);

  ColorProperty get tertiaryContainer =>
      ColorProperty('tertiaryContainer', colorScheme.tertiaryContainer);
  ColorProperty get onTertiaryContainer =>
      ColorProperty('onTertiaryContainer', colorScheme.onTertiaryContainer);

  ColorProperty get tertiaryFixed =>
      ColorProperty('tertiaryFixed', colorScheme.tertiaryFixed);
  ColorProperty get tertiaryFixedDim =>
      ColorProperty('tertiaryFixedDim', colorScheme.tertiaryFixedDim);
  ColorProperty get onTertiaryFixed =>
      ColorProperty('onTertiaryFixed', colorScheme.onTertiaryFixed);
  ColorProperty get onTertiaryFixedVariant => ColorProperty(
      'onTertiaryFixedVariant', colorScheme.onTertiaryFixedVariant);

  ColorProperty get error => ColorProperty('error', colorScheme.error);
  ColorProperty get onError => ColorProperty('onError', colorScheme.onError);

  ColorProperty get errorContainer =>
      ColorProperty('errorContainer', colorScheme.errorContainer);
  ColorProperty get onErrorContainer =>
      ColorProperty('onErrorContainer', colorScheme.onErrorContainer);

  ColorProperty get outline => ColorProperty('outline', colorScheme.outline);
  ColorProperty get outlineVariant =>
      ColorProperty('outlineVariant', colorScheme.outlineVariant);

  ColorProperty get surface => ColorProperty('surface', colorScheme.surface);
  ColorProperty get surfaceDim =>
      ColorProperty('surfaceDim', colorScheme.surfaceDim);

  ColorProperty get surfaceBright =>
      ColorProperty('surfaceBright', colorScheme.surfaceBright);
  ColorProperty get surfaceContainerLowest => ColorProperty(
      'surfaceContainerLowest', colorScheme.surfaceContainerLowest);

  ColorProperty get surfaceContainerLow =>
      ColorProperty('surfaceContainerLow', colorScheme.surfaceContainerLow);
  ColorProperty get surfaceContainer =>
      ColorProperty('surfaceContainer', colorScheme.surfaceContainer);

  ColorProperty get surfaceContainerHigh =>
      ColorProperty('surfaceContainerHigh', colorScheme.surfaceContainerHigh);
  ColorProperty get surfaceContainerHighest => ColorProperty(
      'surfaceContainerHighest', colorScheme.surfaceContainerHighest);

  ColorProperty get onSurface =>
      ColorProperty('onSurface', colorScheme.onSurface);
  ColorProperty get onSurfaceVariant =>
      ColorProperty('onSurfaceVariant', colorScheme.onSurfaceVariant);

  ColorProperty get inverseSurface =>
      ColorProperty('inverseSurface', colorScheme.inverseSurface);
  ColorProperty get onInverseSurface =>
      ColorProperty('onInverseSurface', colorScheme.onInverseSurface);

  ColorProperty get inversePrimary =>
      ColorProperty('inversePrimary', colorScheme.inversePrimary);
  ColorProperty get shadow => ColorProperty('shadow', colorScheme.shadow);

  ColorProperty get scrim => ColorProperty('scrim', colorScheme.scrim);
  ColorProperty get surfaceTint =>
      ColorProperty('surfaceTint', colorScheme.surfaceTint);

  List<ColorProperty> get values => <ColorProperty>[
        primary,
        onPrimary,
        primaryContainer,
        onPrimaryContainer,
        primaryFixed,
        primaryFixedDim,
        onPrimaryFixed,
        onPrimaryFixedVariant,
        secondary,
        onSecondary,
        secondaryContainer,
        onSecondaryContainer,
        secondaryFixed,
        secondaryFixedDim,
        onSecondaryFixed,
        onSecondaryFixedVariant,
        tertiary,
        onTertiary,
        tertiaryContainer,
        onTertiaryContainer,
        tertiaryFixed,
        tertiaryFixedDim,
        onTertiaryFixed,
        onTertiaryFixedVariant,
        error,
        onError,
        errorContainer,
        onErrorContainer,
        outline,
        outlineVariant,
        surface,
        surfaceDim,
        surfaceBright,
        surfaceContainerLowest,
        surfaceContainerLow,
        surfaceContainer,
        surfaceContainerHigh,
        surfaceContainerHighest,
        onSurface,
        onSurfaceVariant,
        inverseSurface,
        onInverseSurface,
        inversePrimary,
        shadow,
        scrim,
        surfaceTint,
      ];

  List<(ColorProperty, ColorProperty)> get pairs =>
      <(ColorProperty, ColorProperty)>[
        (primary, onPrimary),
        (primaryContainer, onPrimaryContainer),
        (primaryFixed, onPrimaryFixed),
        (primaryFixedDim, onPrimaryFixedVariant),
        (secondary, onSecondary),
        (secondaryContainer, onSecondaryContainer),
        (secondaryFixed, onSecondaryFixed),
        (secondaryFixedDim, onSecondaryFixedVariant),
        (tertiary, onTertiary),
        (tertiaryContainer, onTertiaryContainer),
        (tertiaryFixed, onTertiaryFixed),
        (tertiaryFixedDim, onTertiaryFixedVariant),
        (error, onError),
        (errorContainer, onErrorContainer),
        (
          outline,
          ColorProperty('~onOutline~', ColorUtils.contrastThemeColor(outline))
        ),
        (
          outlineVariant,
          ColorProperty('~onOutlineVariant~',
              ColorUtils.contrastThemeColor(outlineVariant))
        ),
        (surface, onSurface),
        (surfaceDim, onSurfaceVariant),
        (surfaceBright, onSurfaceVariant),
        (surfaceContainerLowest, onSurfaceVariant),
        (surfaceContainerLow, onSurfaceVariant),
        (surfaceContainer, onSurfaceVariant),
        (surfaceContainerHigh, onSurfaceVariant),
        (surfaceContainerHighest, onSurfaceVariant),
        (inverseSurface, onInverseSurface),
        (inversePrimary, primary),
        (
          shadow,
          ColorProperty('~onShadow~', ColorUtils.contrastThemeColor(shadow))
        ),
        (
          scrim,
          ColorProperty('~onScrim~', ColorUtils.contrastThemeColor(scrim))
        ),
        (
          surfaceTint,
          ColorProperty(
              '~onSurfaceTint~', ColorUtils.contrastThemeColor(surfaceTint))
        ),
      ];
}
