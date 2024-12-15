class ThemeNotifier extends ChangeNotifier {
  ThemeData _themeData;
  ThemeChanger(this._themeData);

  get getTheme => _themeData;
  void setTheme(ThemeData theme) {
    _themeData = theme;
    notifyListeners();
  }

   void randomise() {
       _themeData = ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: shadeColor.color,
          dynamicSchemeVariant: variant,
          contrastLevel: 0.0,
        ),
      );
      notifyListeners();
   }
}