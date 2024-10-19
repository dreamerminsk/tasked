class DebugViewThemeData with Diagnosticable {
  const  DebugViewThemeData ({
    this.titleTextStyle,
    this.subtitleTextStyle,
  });

  final TextStyle? titleTextStyle;

  final TextStyle? subtitleTextStyle;

  DebugViewThemeData copyWith({
    TextStyle? titleTextStyle,
    TextStyle? subtitleTextStyle,
  }) {
    return DebugViewThemeData(
      titleTextStyle: titleTextStyle ?? this.titleTextStyle,
      subtitleTextStyle: subtitleTextStyle ?? this.subtitleTextStyle,
    );
  }

  static DebugViewThemeData? lerp(DebugViewThemeData? a, DebugViewThemeData? b, double t) {
    if (identical(a, b)) {
      return a;
    }
    return DebugViewThemeData(
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
    return other is DebugViewThemeData
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