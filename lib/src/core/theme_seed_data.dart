class ColorSchemeSeed {
  const  ColorSchemeSeed ({
    this.seedColor,
    this.dynamicSchemeVariant,
    this.contrastLevel,
  });

    NamedMaterialColor color = NamedColors.indigo;
  NamedColor shade = NamedColors.indigo.shade500;
  DynamicSchemeVariant schemeVariant = DynamicSchemeVariant.fidelity;
  num contrastLevel = 0;

  void randomise() {
        seedColor =
        NamedColors.primaries[Random().nextInt(NamedColors.primaries.length)];
    shadeColor = seedColor.shades[Random().nextInt(seedColor.shades.length)];
    variant = DynamicSchemeVariant
        .values[Random().nextInt(DynamicSchemeVariant.values.length)];
  }

  ColorSchemeSeed copyWith({
    TextStyle? titleTextStyle,
    TextStyle? subtitleTextStyle,
  }) {
    return DebugViewThemeData(
      titleTextStyle: titleTextStyle ?? this.titleTextStyle,
      subtitleTextStyle: subtitleTextStyle ?? this.subtitleTextStyle,
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

}