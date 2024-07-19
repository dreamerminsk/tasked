import 'properties.dart';


class NamedColorScheme {
const NamedColorScheme({required this.colorScheme});

final ColorScheme colorScheme;


factory NamedColorScheme.of(BuildContext context) {
final colorScheme = Theme.of(context).colorScheme;
return NamedColorScheme(colorScheme: colorScheme);
}

ColorProperty get primary => ColorProperty();

    return ColorScheme(
      primary: primary ?? Color(MaterialDynamicColors.primary.getArgb(scheme)),
      onPrimary: onPrimary ?? Color(MaterialDynamicColors.onPrimary.getArgb(scheme)),
      primaryContainer: primaryContainer ?? Color(MaterialDynamicColors.primaryContainer.getArgb(scheme)),
      onPrimaryContainer: onPrimaryContainer ?? Color(MaterialDynamicColors.onPrimaryContainer.getArgb(scheme)),
      primaryFixed: primaryFixed ?? Color(MaterialDynamicColors.primaryFixed.getArgb(scheme)),
      primaryFixedDim: primaryFixedDim ?? Color(MaterialDynamicColors.primaryFixedDim.getArgb(scheme)),
      onPrimaryFixed: onPrimaryFixed ?? Color(MaterialDynamicColors.onPrimaryFixed.getArgb(scheme)),
      onPrimaryFixedVariant: onPrimaryFixedVariant ?? Color(MaterialDynamicColors.onPrimaryFixedVariant.getArgb(scheme)),
      secondary: secondary ?? Color(MaterialDynamicColors.secondary.getArgb(scheme)),
      onSecondary: onSecondary ?? Color(MaterialDynamicColors.onSecondary.getArgb(scheme)),
      secondaryContainer: secondaryContainer ?? Color(MaterialDynamicColors.secondaryContainer.getArgb(scheme)),
      onSecondaryContainer: onSecondaryContainer ?? Color(MaterialDynamicColors.onSecondaryContainer.getArgb(scheme)),
      secondaryFixed: secondaryFixed ?? Color(MaterialDynamicColors.secondaryFixed.getArgb(scheme)),
      secondaryFixedDim: secondaryFixedDim ?? Color(MaterialDynamicColors.secondaryFixedDim.getArgb(scheme)),
      onSecondaryFixed: onSecondaryFixed ?? Color(MaterialDynamicColors.onSecondaryFixed.getArgb(scheme)),
      onSecondaryFixedVariant: onSecondaryFixedVariant ?? Color(MaterialDynamicColors.onSecondaryFixedVariant.getArgb(scheme)),
      tertiary: tertiary ?? Color(MaterialDynamicColors.tertiary.getArgb(scheme)),
      onTertiary: onTertiary ?? Color(MaterialDynamicColors.onTertiary.getArgb(scheme)),
      tertiaryContainer: tertiaryContainer ?? Color(MaterialDynamicColors.tertiaryContainer.getArgb(scheme)),
      onTertiaryContainer: onTertiaryContainer ?? Color(MaterialDynamicColors.onTertiaryContainer.getArgb(scheme)),
      tertiaryFixed: tertiaryFixed ?? Color(MaterialDynamicColors.tertiaryFixed.getArgb(scheme)),
      tertiaryFixedDim: tertiaryFixedDim ?? Color(MaterialDynamicColors.tertiaryFixedDim.getArgb(scheme)),
      onTertiaryFixed: onTertiaryFixed ?? Color(MaterialDynamicColors.onTertiaryFixed.getArgb(scheme)),
      onTertiaryFixedVariant: onTertiaryFixedVariant ?? Color(MaterialDynamicColors.onTertiaryFixedVariant.getArgb(scheme)),
      error: error ?? Color(MaterialDynamicColors.error.getArgb(scheme)),
      onError: onError ?? Color(MaterialDynamicColors.onError.getArgb(scheme)),
      errorContainer: errorContainer ?? Color(MaterialDynamicColors.errorContainer.getArgb(scheme)),
      onErrorContainer: onErrorContainer ?? Color(MaterialDynamicColors.onErrorContainer.getArgb(scheme)),
      outline: outline ?? Color(MaterialDynamicColors.outline.getArgb(scheme)),
      outlineVariant: outlineVariant ?? Color(MaterialDynamicColors.outlineVariant.getArgb(scheme)),
      surface: surface ?? Color(MaterialDynamicColors.surface.getArgb(scheme)),
      surfaceDim: surfaceDim ?? Color(MaterialDynamicColors.surfaceDim.getArgb(scheme)),
      surfaceBright: surfaceBright ?? Color(MaterialDynamicColors.surfaceBright.getArgb(scheme)),
      surfaceContainerLowest: surfaceContainerLowest ?? Color(MaterialDynamicColors.surfaceContainerLowest.getArgb(scheme)),
      surfaceContainerLow: surfaceContainerLow ?? Color(MaterialDynamicColors.surfaceContainerLow.getArgb(scheme)),
      surfaceContainer: surfaceContainer ?? Color(MaterialDynamicColors.surfaceContainer.getArgb(scheme)),
      surfaceContainerHigh: surfaceContainerHigh ?? Color(MaterialDynamicColors.surfaceContainerHigh.getArgb(scheme)),
      surfaceContainerHighest: surfaceContainerHighest ?? Color(MaterialDynamicColors.surfaceContainerHighest.getArgb(scheme)),
      onSurface: onSurface ?? Color(MaterialDynamicColors.onSurface.getArgb(scheme)),
      onSurfaceVariant: onSurfaceVariant ?? Color(MaterialDynamicColors.onSurfaceVariant.getArgb(scheme)),
      inverseSurface: inverseSurface ?? Color(MaterialDynamicColors.inverseSurface.getArgb(scheme)),
      onInverseSurface: onInverseSurface ?? Color(MaterialDynamicColors.inverseOnSurface.getArgb(scheme)),
      inversePrimary: inversePrimary ?? Color(MaterialDynamicColors.inversePrimary.getArgb(scheme)),
      shadow: shadow ?? Color(MaterialDynamicColors.shadow.getArgb(scheme)),
      scrim: scrim ?? Color(MaterialDynamicColors.scrim.getArgb(scheme)),
      surfaceTint: surfaceTint ?? Color(MaterialDynamicColors.primary.getArgb(scheme)),
      brightness: brightness,
      // DEPRECATED (newest deprecations at the bottom)
      background: background ?? Color(MaterialDynamicColors.background.getArgb(scheme)),
      onBackground: onBackground ?? Color(MaterialDynamicColors.onBackground.getArgb(scheme)),
      surfaceVariant: surfaceVariant ?? Color(MaterialDynamicColors.surfaceVariant.getArgb(scheme)),
    );
  }

class NamedColorScheme {
static const primary = NamedProperty('primary', );
    required this.primary,
    required this.onPrimary,
    Color? primaryContainer,
    Color? onPrimaryContainer,
    Color? primaryFixed,
    Color? primaryFixedDim,
    Color? onPrimaryFixed,
    Color? onPrimaryFixedVariant,
    required this.secondary,
    required this.onSecondary,
    Color? secondaryContainer,
    Color? onSecondaryContainer,
    Color? secondaryFixed,
    Color? secondaryFixedDim,
    Color? onSecondaryFixed,
    Color? onSecondaryFixedVariant,
    Color? tertiary,
    Color? onTertiary,
    Color? tertiaryContainer,
    Color? onTertiaryContainer,
    Color? tertiaryFixed,
    Color? tertiaryFixedDim,
    Color? onTertiaryFixed,
    Color? onTertiaryFixedVariant,
    required this.error,
    required this.onError,
    Color? errorContainer,
    Color? onErrorContainer,
    required this.surface,
    required this.onSurface,
    Color? surfaceDim,
    Color? surfaceBright,
    Color? surfaceContainerLowest,
    Color? surfaceContainerLow,
    Color? surfaceContainer,
    Color? surfaceContainerHigh,
    Color? surfaceContainerHighest,
    Color? onSurfaceVariant,
    Color? outline,
    Color? outlineVariant,
    Color? shadow,
    Color? scrim,
    Color? inverseSurface,
    Color? onInverseSurface,
    Color? inversePrimary,
    Color? surfaceTint,
}