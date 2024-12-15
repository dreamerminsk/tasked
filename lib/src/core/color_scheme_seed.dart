class ColorSchemeSeed {
  const ColorSchemeSeed({
    required this.seedColor,
    required this.dynamicSchemeVariant,
    required this.contrastLevel,
  });

  factory ColorSchemeSeed.random() {
    final materialColor =
        NamedColors.primaries[Random().nextInt(NamedColors.primaries.length)];
    final seedColor =
        materialColor.shades[Random().nextInt(materialColor.shades.length)];
    final dynamicSchemeVariant = DynamicSchemeVariant
        .values[Random().nextInt(DynamicSchemeVariant.values.length)];
    return ColorSchemeSeed(
      seedColor: seedColor,
      dynamicSchemeVariant: dynamicSchemeVariant,
      contrastLevel: Random().nextDouble() * 2.0 - 1.0,
    );
  }

  NamedColor seedColor = NamedColors.indigo.shade500;
  DynamicSchemeVariant dynamicSchemeVariant = DynamicSchemeVariant.fidelity;
  double contrastLevel = 0.0;

  ColorSchemeSeed copyWith({
    NamedColor? seedColor,
    DynamicSchemeVariant? dynamicSchemeVariant,
    double? contrastLevel,
  }) {
    return ColorSchemeSeed(
      seedColor: seedColor ?? this.seedColor,
      dynamicSchemeVariant: dynamicSchemeVariant ?? this.dynamicSchemeVariant,
      contrastLevel: contrastLevel ?? this.contrastLevel,
    );
  }

  @override
  int get hashCode => Object.hashAll(
        <Object?>[
          seedColor,
          dynamicSchemeVariant,
          contrastLevel,
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
    return other is ColorSchemeSeed &&
        other.seedColor == seedColor &&
        other.dynamicSchemeVariant == dynamicSchemeVariant &&
        other.contrastLevel == contrastLevel;
  }
}
