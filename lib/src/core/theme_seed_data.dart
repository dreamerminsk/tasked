class ThemeSeedData with Diagnosticable {
  const  ThemeSeedData ({
    this.titleTextStyle,
    this.subtitleTextStyle,
  });

    NamedMaterialColor color = NamedColors.indigo;
  NamedColor shade = NamedColors.indigo.shade500;
  DynamicSchemeVariant schemeVariant = DynamicSchemeVariant.fidelity;
  num contrastLevel = 0;

  void randomise() {
        seedColor =
        NamedColors.primaries[Random().nextInt(NamedColors.primaries.length)];
    var shades = [
      seedColor.shade50,
      seedColor.shade100,
      seedColor.shade200,
      seedColor.shade300,
      seedColor.shade400,
      seedColor.shade500,
      seedColor.shade600,
      seedColor.shade700,
      seedColor.shade800,
      seedColor.shade900,
    ];
    shades.shuffle();
    shadeColor = shades[0];
    variant = DynamicSchemeVariant
        .values[Random().nextInt(DynamicSchemeVariant.values.length)];
  }

  ThemeSeedData copyWith({
    TextStyle? titleTextStyle,
    TextStyle? subtitleTextStyle,
  }) {
    return DebugViewThemeData(
      titleTextStyle: titleTextStyle ?? this.titleTextStyle,
      subtitleTextStyle: subtitleTextStyle ?? this.subtitleTextStyle,
    );
  }

  static ThemeSeedData? lerp(ThemeSeedData? a, ThemeSeedData? b, double t) {
    if (identical(a, b)) {
      return a;
    }
    return ThemeSeedData(
      titleTextStyle: TextStyle.lerp(a?.titleTextStyle, b?.titleTextStyle, t),
      subtitleTextStyle: TextStyle.lerp(a?.subtitleTextStyle, b?.subtitleTextStyle, t),
    );
  }

  @override
  int get hashCode => Object.hashAll(
        <Object?>[
          titleTextStyle,
          subtitleTextStyle,
        ],
      );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other.runtimeType != runtimeType) {
      return false;
    }
    return other is ThemeSeedData
      && other.titleTextStyle == titleTextStyle
      && other.subtitleTextStyle == subtitleTextStyle;
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<TextStyle>('titleTextStyle', titleTextStyle, defaultValue: null));
    properties.add(DiagnosticsProperty<TextStyle>('subtitleTextStyle', subtitleTextStyle, defaultValue: null));
  }
}