import 'properties.dart';


class NamedColorScheme {
  const NamedColorScheme({
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
  }) : _primaryContainer = primaryContainer,
       _onPrimaryContainer = onPrimaryContainer,
       _primaryFixed = primaryFixed,
       _primaryFixedDim = primaryFixedDim,
       _onPrimaryFixed = onPrimaryFixed,
       _onPrimaryFixedVariant = onPrimaryFixedVariant,
       _secondaryContainer = secondaryContainer,
       _onSecondaryContainer = onSecondaryContainer,
       _secondaryFixed = secondaryFixed,
       _secondaryFixedDim = secondaryFixedDim,
       _onSecondaryFixed = onSecondaryFixed,
       _onSecondaryFixedVariant = onSecondaryFixedVariant,
       _tertiary = tertiary,
       _onTertiary = onTertiary,
       _tertiaryContainer = tertiaryContainer,
       _onTertiaryContainer = onTertiaryContainer,
       _tertiaryFixed = tertiaryFixed,
       _tertiaryFixedDim = tertiaryFixedDim,
       _onTertiaryFixed = onTertiaryFixed,
       _onTertiaryFixedVariant = onTertiaryFixedVariant,
       _errorContainer = errorContainer,
       _onErrorContainer = onErrorContainer,
       _surfaceDim = surfaceDim,
       _surfaceBright = surfaceBright,
       _surfaceContainerLowest = surfaceContainerLowest,
       _surfaceContainerLow = surfaceContainerLow,
       _surfaceContainer = surfaceContainer,
       _surfaceContainerHigh = surfaceContainerHigh,
       _surfaceContainerHighest = surfaceContainerHighest,
       _onSurfaceVariant = onSurfaceVariant,
       _outline = outline,
       _outlineVariant = outlineVariant,
       _shadow = shadow,
       _scrim = scrim,
       _inverseSurface = inverseSurface,
       _onInverseSurface = onInverseSurface,
       _inversePrimary = inversePrimary,
       _surfaceTint = surfaceTint,
       // DEPRECATED (newest deprecations at the bottom)
       _background = background,
       _onBackground = onBackground,
       _surfaceVariant = surfaceVariant;

  /// Generate a [ColorScheme] derived from the given `seedColor`.
  ///
  /// Using the `seedColor` as a starting point, a set of tonal palettes are
  /// constructed. By default, the tonal palettes are based on the Material 3
  /// Color system and provide all of the [ColorScheme] colors. These colors are
  /// designed to work well together and meet contrast requirements for
  /// accessibility.
  ///
  /// If any of the optional color parameters are non-null they will be
  /// used in place of the generated colors for that field in the resulting
  /// color scheme. This allows apps to override specific colors for their
  /// needs.
  ///
  /// Given the nature of the algorithm, the `seedColor` may not wind up as
  /// one of the ColorScheme colors.
  ///
  /// The `dynamicSchemeVariant` parameter creates different types of
  /// [DynamicScheme]s, which are used to generate different styles of [ColorScheme]s.
  /// By default, `dynamicSchemeVariant` is set to `tonalSpot`. A [ColorScheme]
  /// constructed by `dynamicSchemeVariant.tonalSpot` has pastel palettes and
  /// won't be too "colorful" even if the `seedColor` has a high chroma value.
  /// If the resulting color scheme is too dark, consider setting `dynamicSchemeVariant`
  /// to [DynamicSchemeVariant.fidelity], whose palettes match the seed color.
  ///
  /// The `contrastLevel` parameter indicates the contrast level between color
  /// pairs, such as [primary] and [onPrimary]. 0.0 is the default (normal);
  /// -1.0 is the lowest; 1.0 is the highest. From Material Design guideline, the
  /// medium and high contrast correspond to 0.5 and 1.0 respectively.
  ///
  /// {@tool dartpad}
  /// This sample shows how to use [ColorScheme.fromSeed] to create dynamic
  /// color schemes with different [DynamicSchemeVariant]s and different
  /// contrast level.
  ///
  /// ** See code in examples/api/lib/material/color_scheme/color_scheme.0.dart **
  /// {@end-tool}
  ///
  /// See also:
  ///
  ///  * <https://m3.material.io/styles/color/the-color-system/color-roles>, the
  ///    Material 3 Color system specification.
  ///  * <https://pub.dev/packages/material_color_utilities>, the package
  ///    used to generate the tonal palettes needed for the scheme.
  factory ColorScheme.fromSeed({
    required Color seedColor,
    Brightness brightness = Brightness.light,
    DynamicSchemeVariant dynamicSchemeVariant = DynamicSchemeVariant.tonalSpot,
    double contrastLevel = 0.0,
    Color? primary,
    Color? onPrimary,
    Color? primaryContainer,
    Color? onPrimaryContainer,
    Color? primaryFixed,
    Color? primaryFixedDim,
    Color? onPrimaryFixed,
    Color? onPrimaryFixedVariant,
    Color? secondary,
    Color? onSecondary,
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
    Color? error,
    Color? onError,
    Color? errorContainer,
    Color? onErrorContainer,
    Color? outline,
    Color? outlineVariant,
    Color? surface,
    Color? onSurface,
    Color? surfaceDim,
    Color? surfaceBright,
    Color? surfaceContainerLowest,
    Color? surfaceContainerLow,
    Color? surfaceContainer,
    Color? surfaceContainerHigh,
    Color? surfaceContainerHighest,
    Color? onSurfaceVariant,
    Color? inverseSurface,
    Color? onInverseSurface,
    Color? inversePrimary,
    Color? shadow,
    Color? scrim,
    Color? surfaceTint,
    @Deprecated(
      'Use surface instead. '
      'This feature was deprecated after v3.18.0-0.1.pre.'
    )
    Color? background,
    @Deprecated(
      'Use onSurface instead. '
      'This feature was deprecated after v3.18.0-0.1.pre.'
    )
    Color? onBackground,
    @Deprecated(
      'Use surfaceContainerHighest instead. '
      'This feature was deprecated after v3.18.0-0.1.pre.'
    )
    Color? surfaceVariant,
  }) {
    final DynamicScheme scheme = _buildDynamicScheme(brightness, seedColor, dynamicSchemeVariant, contrastLevel);

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